import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.percentProgress,
    this.color,
    this.minHeight,
  });
  final double percentProgress;
  final Color? color;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.grey.shade300,
      value: percentProgress / 100,
      color: color ?? Theme.of(context).primaryColor,
      minHeight: minHeight ?? 8,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
  }
}
