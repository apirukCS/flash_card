import 'dart:developer';

import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/core/enums/level_vocab_enum.dart';
import 'package:flash_card/presentation/pages/home/widgets/daily_challenge_card.dart';
import 'package:flash_card/presentation/pages/home/widgets/level_card.dart';
import 'package:flash_card/presentation/pages/home/widgets/status_card.dart';
import 'package:flash_card/presentation/resources/app_colors.dart';
import 'package:flash_card/presentation/widgets/texts/app_large_text.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FlashCard',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppText(
                        text: 'เรียนรู้คำศัพท์ได้ง่าย',
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.asset("assets/images/cat.gif", width: 90),
                  ),
                ],
              ),
              const SizedBox(height: largeSpace * 2 - normalSpace),
              StatusCard(),
              SizedBox(height: largeSpace * 2 - normalSpace),
              DailyChallengeCard(),
              SizedBox(height: normalSpace * 3),
              AppLargeText(text: 'ระดับการเรียน', isBold: true),
              SizedBox(height: largeSpace),
              LevelCard(
                progress: 80,
                title: "ระดับเริ่มต้น ⭐️",
                detail: "ความก้าวหน้า",
                levelVocab: LevelVocabEnum.beginner,
              ),
              SizedBox(height: smallSpace * 3),
              LevelCard(
                progress: 20,
                title: "ระดับพื้นฐาน",
                detail: "ความก้าวหน้า",
                levelVocab: LevelVocabEnum.basic,
              ),
              const SizedBox(height: smallSpace * 3),
              LevelCard(
                progress: 0,
                title: "ระดับกลาง 🔒",
                detail: "ความก้าวหน้า",
                levelVocab: LevelVocabEnum.medium,
              ),
              const SizedBox(height: smallSpace * 3),
              LevelCard(
                progress: 0,
                title: "ระดับสูง 🔒",
                detail: "ความก้าวหน้า",
                levelVocab: LevelVocabEnum.expert,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
