import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/widgets/app_back_icon.dart';
import 'package:flash_card/presentation/widgets/buttons/app_button.dart';
import 'package:flash_card/presentation/widgets/texts/app_large_text.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class HeaderFlashCard extends StatelessWidget {
  const HeaderFlashCard({super.key, required this.state});

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
            AppLargeText(text: "ระดับ 1", isBold: true),
            AppText(
              text: "${(state.currentIndex ?? 0) + 1} / ${vocabularies.length}",
            ),
          ],
        ),
        AppButton(
          text: "ทดสอบ",
          backgroundColor: Color(0xFF10B981),
          onTap: () {},
        ),
      ],
    );
  }
}
