import 'package:flash_card/presentation/pages/home/widgets/daily_challenge_card.dart';
import 'package:flash_card/presentation/pages/home/widgets/level_card.dart';
import 'package:flash_card/presentation/pages/home/widgets/status_card.dart';
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
                    children: [Text('FlashCard'), Text('test')],
                  ),
                  Icon(Icons.abc),
                ],
              ),
              const SizedBox(height: 16),
              StatusCard(),
              const SizedBox(height: 16),
              DailyChallengeCard(),
              const SizedBox(height: 8),
              Text('Cards', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 8),
              LevelCard(),
              const SizedBox(height: 8),
              LevelCard(),
              const SizedBox(height: 8),
              LevelCard(),
              const SizedBox(height: 8),
              LevelCard(),
            ],
          ),
        ),
      ),
    );
  }
}
