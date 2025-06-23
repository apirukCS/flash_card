import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/presentation/widgets/texts/app_small_text.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.progress,
    required this.title,
    required this.detail,
  });

  final String title;
  final String detail;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(largeSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: title, isBold: true, fontSize: 16),
                  SizedBox(height: normalSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppSmallText(text: detail),
                      AppText(text: "${progress.toInt()}%"),
                    ],
                  ),
                  SizedBox(height: smallSpace + (smallSpace / 2)),
                  LinearProgressIndicator(
                    value: progress / 100,
                    color: Theme.of(context).primaryColor,
                    minHeight: 6,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: largeSpace),
          Container(
            padding: EdgeInsets.all(smallSpace * 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: const Color.fromARGB(255, 211, 230, 246),
            ),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
              color: Colors.blueAccent.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
