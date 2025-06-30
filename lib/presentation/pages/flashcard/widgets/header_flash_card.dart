import 'package:flash_card/core/router/app_routers.dart';
import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/core/functions/app_fn.dart';
import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/widgets/app_back_icon.dart';
import 'package:flash_card/presentation/widgets/buttons/app_button.dart';
import 'package:flash_card/presentation/widgets/texts/app_large_text.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderFlashCard extends StatefulWidget {
  const HeaderFlashCard({super.key, required this.state});

  final VocabularyState state;

  @override
  State<HeaderFlashCard> createState() => _HeaderFlashCardState();
}

class _HeaderFlashCardState extends State<HeaderFlashCard> {
  @override
  Widget build(BuildContext context) {
    var vocabularies = widget.state.vocabularies;
    var numberLevel = vocabularies.isEmpty ? 1 : vocabularies[0].levelId;
    var levelName = AppFn().getNameLevel(numberLevel);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(right: largeSpace),
          child: AppBackIcon(),
        ),

        Column(
          children: [
            AppLargeText(text: "$levelName", isBold: true),
            AppText(
              text:
                  "${(widget.state.currentIndex ?? 0) + 1} / ${vocabularies.length}",
            ),
          ],
        ),
        AppButton(
          text: "ทดสอบ",
          backgroundColor: Color(0xFF10B981),
          onTap: () => _onTapStartToTest(context),
        ),
      ],
    );
  }

  _onTapStartToTest(BuildContext c) {
    if (widget.state.vocabularies.isEmpty) return;
    var levelId = widget.state.vocabularies[0].levelId;
    Navigator.pushNamed(c, AppRouter.quiz, arguments: {'level_id': levelId});
    context.read<VocabularyBloc>().add(UpdateCurrentIndex(index: 0));
  }
}
