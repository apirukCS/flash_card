import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/presentation/resources/app_colors.dart';
import 'package:flash_card/presentation/widgets/texts/app_large_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioButton extends StatefulWidget {
  const AudioButton({super.key, required this.text});

  final String text;

  @override
  State<AudioButton> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  FlutterTts? flutterTts;
  double volume = 1;
  double pitch = 1.0;
  double rate = 1;

  @override
  initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  @override
  void dispose() {
    flutterTts?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _speak,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          largeSpace,
          normalSpace,
          largeSpace,
          normalSpace,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: const Color.fromARGB(255, 224, 236, 246),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.volume_up_outlined,
              color: AppColors.primaryColor,
              size: 24,
            ),
            const SizedBox(width: normalSpace),
            Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: AppLargeText(
                text: "ฟังเสียง",
                isBold: true,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _speak() async {
    await flutterTts?.setVolume(volume);
    await flutterTts?.setSpeechRate(rate);
    await flutterTts?.setPitch(pitch);

    if (widget.text.isNotEmpty) {
      await flutterTts?.speak(widget.text);
    }
  }
}
