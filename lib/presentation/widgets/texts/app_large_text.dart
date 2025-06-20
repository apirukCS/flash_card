import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  const AppLargeText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(),);
  }
}
