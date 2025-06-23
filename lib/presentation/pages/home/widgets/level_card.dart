import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Test", style: TextStyle(fontSize: 20)),
                  Text("details"),
                ],
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }
}
