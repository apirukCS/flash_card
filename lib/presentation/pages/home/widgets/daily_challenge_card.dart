import 'package:flash_card/presentation/widgets/buttons/app_button.dart';
import 'package:flash_card/presentation/widgets/texts/app_large_text.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Theme.of(context).primaryColor, Colors.pink.shade300],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLargeText(
                text: "Daily Challenge",
                color: Colors.white,
                isBold: true,
              ),
              AppText(text: "ทำแบบทดสอบ 5 คำวันนี้", color: Colors.white),
            ],
          ),
          AppButton(
            text: "เริ่มเลย!",
            onTap: () {},
            backgroundColor: const Color.fromARGB(255, 242, 112, 156),
          ),
        ],
      ),
    );
  }
}
