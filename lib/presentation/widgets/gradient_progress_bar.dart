import 'package:flutter/material.dart';

class GradientProgressBar extends StatelessWidget {
  final double percent;
  final double height;

  const GradientProgressBar({
    super.key,
    required this.percent,
    this.height = 12,
  });

  @override
  Widget build(BuildContext context) {
    var percent = this.percent / 100;
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: Container(
        height: height,
        decoration: BoxDecoration(color: Colors.grey.shade300),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: percent.clamp(0.0, 1.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Colors.pink.shade300,
                  ],
                ),
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
