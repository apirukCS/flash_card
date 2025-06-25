import 'package:flash_card/app/app_routers.dart';
import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/core/enums/level_vocab_enum.dart';
import 'package:flash_card/data/models/choice_model.dart';
import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/pages/quiz/widgets/question_card.dart';
import 'package:flash_card/presentation/pages/quiz/widgets/quize_header.dart';
import 'package:flash_card/presentation/widgets/buttons/app_gradient_button.dart';
import 'package:flash_card/presentation/widgets/gradient_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.level});

  final LevelVocabEnum level;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late VocabularyBloc _vocabBloc;

  @override
  void initState() {
    _vocabBloc = context.read<VocabularyBloc>();
    _vocabBloc.add(GetAllByLevel(levelId: widget.level.id()));
    super.initState();
  }

  @override
  void dispose() {
    _vocabBloc.add(UpdateCurrentIndex(index: 0));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 235, 237),
        body: BlocBuilder<VocabularyBloc, VocabularyState>(
          builder: (context, state) {
            var vocabularies = state.vocabularies;
            var index = state.currentIndex ?? 0;
            var currentVocab =
                vocabularies.isNotEmpty ? vocabularies[index] : null;
            var percent = ((index + 1) / vocabularies.length) * 100.0;

            return Padding(
              padding: EdgeInsets.all(largeSpace),
              child: Column(
                children: [
                  QuizHeader(state: state),
                  const SizedBox(height: normalSpace * 3),
                  GradientProgressBar(percent: percent),
                  const SizedBox(height: largeSpace * 2 + smallSpace),
                  if (currentVocab != null) QuestionCard(vocab: currentVocab),
                  const SizedBox(height: largeSpace * 2 + smallSpace),
                  AppGradientButton(
                    text: "ยืนยันคำตอบ",
                    onTap: _submit,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    verticalPadding: smallSpace * 5,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _submit() {
    var vocabBloc = context.read<VocabularyBloc>();
    var index = vocabBloc.state.currentIndex ?? 0;
    var vocabularies = vocabBloc.state.vocabularies;

    if (index == vocabularies.length - 1) return;
    if (vocabBloc.state.choiceSelected == null) return;

    vocabBloc.add(UpdateChoiceSelected(choice: ChoiceModel()));
    vocabBloc.add(UpdateCurrentIndex(index: index + 1));
    _checkTestingIsComplete();
  }

  _checkTestingIsComplete() {
    var vocabBloc = context.read<VocabularyBloc>();
    var vocabularies = vocabBloc.state.vocabularies;

    var index = vocabBloc.state.currentIndex;
    if (index == vocabularies.length - 2) {
      Navigator.pushNamed(
        context,
        AppRouter.result,
        arguments: {'level_id': widget.level.id()},
      );
    }
  }
}
