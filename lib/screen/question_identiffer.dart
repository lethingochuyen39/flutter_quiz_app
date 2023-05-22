import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';

class QuestionIdentifier extends StatelessWidget {
  final int questionIndex;
  final bool isCorrectQuestion;

  const QuestionIdentifier(
      {super.key,
      required this.isCorrectQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectQuestion
            ? const Color.fromARGB(255, 154, 205, 249)
            : const Color.fromARGB(255, 241, 34, 100),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
