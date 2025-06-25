import 'dart:async';
import 'package:flutter/material.dart';

class AwardRowAnimation extends StatefulWidget {
  const AwardRowAnimation({super.key});

  @override
  State<AwardRowAnimation> createState() => _AwardRowAnimationState();
}

class _AwardRowAnimationState extends State<AwardRowAnimation> {
  bool _showSecondImage = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        _showSecondImage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const largeSpace = 16.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: !_showSecondImage ? 120 : 0),
        Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(largeSpace),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            color: Colors.orange.shade300,
          ),
          child: Image.asset("assets/images/cup_award.png"),
        ),

        const SizedBox(width: largeSpace),
        AnimatedSlide(
          offset: _showSecondImage ? Offset.zero : const Offset(3, 0),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: Container(
            width: 120,
            height: 120,
            padding: const EdgeInsets.all(largeSpace),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              color: Colors.orange.shade300,
            ),
            child: Image.asset("assets/images/cat.gif"),
          ),
        ),
      ],
    );
  }
}
