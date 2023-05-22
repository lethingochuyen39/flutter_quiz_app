import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionCreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;

  const QuestionCreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionCreen> createState() => _QuestionCreenState();
}

class _QuestionCreenState extends State<QuestionCreen> {
  var currentQuestionIndex = 0;

  answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      //tang cau hoi tiep theo
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        //di tu tren xuong duoi
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                //hien thi cau hoi
                currentQuestion.text,
                style: GoogleFonts.heebo(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              //map ->list mới chứa từng widget dúng ...loop qua list lay từng phần tử ra bên ngoài
              ...currentQuestion.getShuffledAnswer().map(
                    (answer) => ElevatedButton(
                      onPressed: () {
                        answerQuestion(answer);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        backgroundColor: Color.fromARGB(255, 40, 66, 118),
                        foregroundColor: Color.fromARGB(255, 246, 246, 245),
                        fixedSize: Size.fromWidth(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        answer,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
            ]),
      ),
    );
  }
}
