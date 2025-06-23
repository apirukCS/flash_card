import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [card(), const SizedBox(width: 12), card()]);
  }

  card() {
    return Expanded(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
      ),
    );
  }
}
