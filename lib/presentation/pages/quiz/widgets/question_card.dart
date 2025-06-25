import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/pages/quiz/widgets/answer_option.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({super.key, required this.vocab});

  final VocabularyModel vocab;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  late VocabularyBloc _vocabBloc;

  @override
  void initState() {
    _vocabBloc = context.read<VocabularyBloc>();
    var vocabId = widget.vocab.id;
    _vocabBloc.add(GetChoicesByVocabId(vocabId: vocabId));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant QuestionCard oldWidget) {
    if (widget.vocab.id != oldWidget.vocab.id) {
      var vocabId = widget.vocab.id;
      _vocabBloc.add(GetChoicesByVocabId(vocabId: vocabId));
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _vocabBloc.add(UpdateCurrentIndex(index: 0));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(normalSpace * 3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 240, 240),
        borderRadius: BorderRadius.circular(16),
        boxShadow: kElevationToShadow[2],
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          AppText(
            text: "${widget.vocab.frontText} แปลว่าอะไร",
            fontSize: 22,
            isBold: true,
          ),
          const SizedBox(height: normalSpace * 3),
          BlocBuilder<VocabularyBloc, VocabularyState>(
            builder: (context, state) {
              var choices = state.choices ?? [];
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: largeSpace);
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: choices.length,
                itemBuilder: (context, index) {
                  var choice = choices[index];
                  var isSelected = state.choiceSelected?.id == choice.id;
                  return AnswerOption(
                    number: String.fromCharCode(65 + index),
                    choice: choice,
                    isSelected: isSelected,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
