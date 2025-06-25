import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/widgets/app_back_icon.dart';
import 'package:flash_card/presentation/widgets/texts/app_large_text.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({super.key, required this.state});

  final VocabularyState state;

  @override
  Widget build(BuildContext context) {
    var vocabularies = state.vocabularies;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBackIcon(),
        Column(
          children: [
            AppLargeText(text: "แบบทดสอบ", isBold: true),
            AppText(
              text:
                  "ข้อ ${(state.currentIndex ?? 0) + 1} / ${vocabularies.length}",
            ),
          ],
        ),
        SizedBox(width: largeSpace * 2),
      ],
    );
  }
}
