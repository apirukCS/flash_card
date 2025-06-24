import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/core/enums/level_vocab_enum.dart';
import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/pages/flashcard/widgets/bottom_action_flash_card.dart';
import 'package:flash_card/presentation/pages/flashcard/widgets/header_flash_card.dart';
import 'package:flash_card/presentation/pages/flashcard/widgets/vocabulary_card.dart';
import 'package:flash_card/presentation/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashCardPage extends StatefulWidget {
  const FlashCardPage({super.key, required this.level});

  final LevelVocabEnum level;

  @override
  State<FlashCardPage> createState() => _FlashCardPageState();
}

class _FlashCardPageState extends State<FlashCardPage> {
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
        backgroundColor: const Color.fromARGB(255, 233, 227, 222),
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
                  HeaderFlashCard(state: state),
                  const SizedBox(height: normalSpace * 3),
                  ProgressBar(
                    percentProgress: percent,
                    color: Colors.green.shade600,
                    minHeight: 8,
                  ),
                  const SizedBox(height: largeSpace * 2 + smallSpace),
                  if (currentVocab != null)
                    VocabularyCard(vocabulary: currentVocab),
                  const SizedBox(height: largeSpace * 3),
                  BottomActionFlashCard(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
