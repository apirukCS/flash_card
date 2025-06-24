import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.textColor,
    this.prefix,
    this.fontSize,
  });

  final String text;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget? prefix;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            color: backgroundColor ?? Colors.purple.shade200,
            width: 2,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? largeSpace,
            vertical: verticalPadding ?? 0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null) prefix!,
            AppText(
              text: text,
              color: textColor,
              isBold: true,
              fontSize: fontSize,
            ),
          ],
        ),
      ),
    );
  }
}
