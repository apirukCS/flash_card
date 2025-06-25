import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.isBold,
    this.color,
    this.fontWeight,
    this.fontSize,
  });

  final String text;
  final bool? isBold;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight ?? (isBold == true ? FontWeight.bold : null),
        color: color,
        fontSize: fontSize ?? normalTextSize,
      ),
    );
  }
}
