import 'package:flash_card/app/app_routers.dart';
import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/core/enums/level_vocab_enum.dart';
import 'package:flash_card/presentation/pages/quiz/widgets/award_row_animation.dart';
import 'package:flash_card/presentation/resources/app_colors.dart';
import 'package:flash_card/presentation/widgets/buttons/app_gradient_button.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.level});

  final LevelVocabEnum level;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (pop, _) {
        _goToHomePage(context);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 240, 215),
          body: Padding(
            padding: const EdgeInsets.all(largeSpace * 2),
            child: Column(
              children: [
                AwardRowAnimation(),
                const SizedBox(height: largeSpace),
                AppText(text: "ยินดีด้วย!", isBold: true, fontSize: 34),
                const SizedBox(height: normalSpace),
                Container(
                  margin: EdgeInsets.all(largeSpace),
                  padding: EdgeInsets.all(largeSpace * 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: const Color.fromARGB(255, 250, 249, 249),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: normalSpace),
                      AppText(
                        text: "8/10",
                        fontSize: 64,
                        isBold: true,
                        fontWeight: FontWeight.w900,
                        color: Colors.green.shade600,
                      ),
                      AppText(text: "คะแนนที่ได้"),
                      const SizedBox(height: normalSpace),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: "คำตอบถูก", isBold: true),
                          AppText(
                            text: "8 ข้อ",
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Colors.green.shade600,
                          ),
                        ],
                      ),
                      const SizedBox(height: largeSpace),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: "คำตอบผิด", isBold: true),
                          AppText(
                            text: "2 ข้อ",
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            color: Colors.red.shade600,
                          ),
                        ],
                      ),
                      const SizedBox(height: largeSpace),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: "เวลาที่ใช้ไป", isBold: true),
                          AppText(
                            text: "2:45",
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: largeSpace * 2),
                      Container(
                        padding: EdgeInsets.all(largeSpace),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: "🎉  ปลดล็อกระดับใหม่แล้ว!",
                              color: Colors.grey.shade800,
                              isBold: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: normalSpace),
                Padding(
                  padding: EdgeInsets.all(largeSpace),
                  child: AppGradientButton(
                    text: "เรียนระดับถัดไป",
                    onTap: () => _nextLevel(context),
                    width: double.infinity,
                    fontWeight: FontWeight.w900,
                    verticalPadding: normalSpace * 3 - smallSpace,
                    backgroundColors: [
                      Colors.green.shade600,
                      Colors.green.shade400,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _nextLevel(BuildContext context) {
    _goToHomePage(context);
    Navigator.pushNamed(
      context,
      AppRouter.flashCard,
      arguments: {'level_id': level.id() + 1},
    );
  }

  _goToHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRouter.home);
  }
}
