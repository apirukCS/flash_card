import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flutter/material.dart';

class AppBackIcon extends StatelessWidget {
  const AppBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.all(Radius.circular(40)),
      child: Container(
        padding: EdgeInsets.all(normalSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        child: Icon(Icons.arrow_back, size: 22),
      ),
    );
  }
}
