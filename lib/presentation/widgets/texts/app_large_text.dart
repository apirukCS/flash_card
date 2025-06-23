import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  const AppLargeText({super.key, required this.text, this.isBold, this.color});

  final String text;
  final bool? isBold;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: largeTextSize,
        fontWeight: isBold == true ? FontWeight.bold : null,
        color: color,
      ),
    );
  }
}
