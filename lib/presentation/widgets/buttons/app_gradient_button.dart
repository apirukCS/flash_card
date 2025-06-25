import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class AppGradientButton extends StatelessWidget {
  const AppGradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.horizontalPadding,
    this.verticalPadding,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.backgroundColors,
  });

  final String text;
  final double? width;
  final Color? textColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? fontSize;

  final List<Color>? backgroundColors;

  final FontWeight? fontWeight;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? largeSpace,
            vertical: verticalPadding ?? 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors:
                  backgroundColors ??
                  [Theme.of(context).primaryColor, Colors.pink.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          alignment: Alignment.center,
          child: AppText(
            text: text,
            color: textColor ?? Colors.white,
            isBold: true,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
