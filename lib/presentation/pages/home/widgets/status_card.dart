import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 100, color: Colors.white)),
        const SizedBox(width: 12),
        Expanded(child: Container(height: 100, color: Colors.white)),
      ],
    );
  }
}
