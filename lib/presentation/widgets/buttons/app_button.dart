import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.textColor,
    this.fontSize,
  });

  final String text;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? fontSize;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor ?? Colors.purple.shade200,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? largeSpace,
            vertical: verticalPadding ?? 0,
          ),
        ),
        child: AppText(
          text: text,
          color: textColor ?? Colors.white,
          isBold: true,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
