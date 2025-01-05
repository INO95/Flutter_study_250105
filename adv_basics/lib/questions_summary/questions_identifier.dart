import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsIdentifier extends StatelessWidget {
  const QuestionsIdentifier(
      {super.key, required this.isCorrectAnswer, required this.questionIndex});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 83, 197, 220)
            : const Color.fromARGB(255, 164, 49, 151),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 3, 3, 3),
        ),
      ),
    );
  }
}
