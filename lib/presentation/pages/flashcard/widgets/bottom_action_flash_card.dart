import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/resources/app_colors.dart';
import 'package:flash_card/presentation/widgets/buttons/app_button.dart';
import 'package:flash_card/presentation/widgets/buttons/app_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomActionFlashCard extends StatefulWidget {
  const BottomActionFlashCard({super.key});

  @override
  State<BottomActionFlashCard> createState() => _BottomActionFlashCardState();
}

class _BottomActionFlashCardState extends State<BottomActionFlashCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppOutlineButton(
            text: "ก่อนหน้า",
            onTap: _prevVocab,
            fontSize: 18,
            verticalPadding: smallSpace * 5,
            backgroundColor: const Color.fromARGB(255, 245, 172, 165),
            textColor: Colors.green.shade800,
          ),
        ),
        const SizedBox(width: largeSpace),
        Expanded(
          child: AppButton(
            onTap: _nextVocab,
            text: "ถัดไป",
            fontSize: 18,
            verticalPadding: smallSpace * 5,
            backgroundColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  _prevVocab() {
    var index = context.read<VocabularyBloc>().state.currentIndex ?? 0;
    if (index == 0) return;
    context.read<VocabularyBloc>().add(UpdateCurrentIndex(index: index - 1));
  }

  _nextVocab() {
    var index = context.read<VocabularyBloc>().state.currentIndex ?? 0;
    var vocabularies = context.read<VocabularyBloc>().state.vocabularies;
    if (index == vocabularies.length - 1) return;
    context.read<VocabularyBloc>().add(UpdateCurrentIndex(index: index + 1));
  }
}
