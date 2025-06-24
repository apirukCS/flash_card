import 'dart:math';

import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/data/models/vocabulary_model.dart';
import 'package:flash_card/presentation/widgets/audio_button.dart';
import 'package:flutter/material.dart';

class VocabularyCard extends StatefulWidget {
  const VocabularyCard({super.key, required this.vocabulary});

  final VocabularyModel vocabulary;

  @override
  State<VocabularyCard> createState() => _VocabularyCardState();
}

class _VocabularyCardState extends State<VocabularyCard>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  late AnimationController _controller;

  void _flipCard() {
    setState(() {
      _showFrontSide = !_showFrontSide;
      if (_showFrontSide) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFront() {
    return _cardContainer(
      key: const ValueKey(true),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.vocabulary.frontText,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: largeSpace),
          AudioButton(text: widget.vocabulary.frontText),
          SizedBox(height: largeSpace),
          Text("แตะเพื่อดูความหมาย", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBack() {
    return _cardContainer(
      key: const ValueKey(false),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.vocabulary.backText,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            ),
          ),
          SizedBox(height: largeSpace),
          Text("แตะเพื่อกลับไปดูคำศัพท์", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _cardContainer({required Widget child, required Key key}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 240, 240),
        borderRadius: BorderRadius.circular(16),
        boxShadow: kElevationToShadow[2],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _flipCard,
      child: SizedBox(
        height: size.height * 0.38,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final angle = _controller.value * pi;
            final isFront = angle <= pi / 2;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(angle),
              child:
                  isFront
                      ? _buildFront()
                      : Transform(
                        transform: Matrix4.rotationY(pi),
                        alignment: Alignment.center,
                        child: _buildBack(),
                      ),
            );
          },
        ),
      ),
    );
  }
}
