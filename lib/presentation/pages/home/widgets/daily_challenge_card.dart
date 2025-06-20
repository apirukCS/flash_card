import 'package:flutter/material.dart';

class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.lightBlue,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Daily Challenge",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Text(
                "ทำแบบทดสอบ 5 คำวันนี้",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text("Test")),
        ],
      ),
    );
  }
}
