import 'package:flash_card/core/constants/app_variables.dart';
import 'package:flash_card/data/models/choice_model.dart';
import 'package:flash_card/presentation/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:flash_card/presentation/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerOption extends StatefulWidget {
  const AnswerOption({
    super.key,
    required this.number,
    required this.choice,
    required this.isSelected,
  });

  final String number;
  final ChoiceModel choice;
  final bool isSelected;

  @override
  State<AnswerOption> createState() => _AnswerOptionState();
}

class _AnswerOptionState extends State<AnswerOption> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Container(
        padding: EdgeInsets.all(largeSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color:
              widget.isSelected == true
                  ? const Color.fromARGB(255, 208, 221, 232)
                  : const Color.fromARGB(255, 228, 227, 227),
          border: Border.all(
            color: const Color.fromARGB(255, 214, 213, 213),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              padding: EdgeInsets.all(smallSpace),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey.shade400, width: 2),
              ),
              child: Center(
                child: AppText(text: widget.number, isBold: true, fontSize: 16),
              ),
            ),
            const SizedBox(width: normalSpace),
            Expanded(
              child: AppText(text: widget.choice.text ?? "", isBold: true),
            ),
          ],
        ),
      ),
    );
  }

  _onTap() {
    context.read<VocabularyBloc>().add(
      UpdateChoiceSelected(choice: widget.choice),
    );
  }
}
