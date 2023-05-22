import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screen/question_screen.dart';
import 'package:flutter_quiz_app/screen/result_screen.dart';
import 'package:flutter_quiz_app/screen/start.dart';

import '../data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
//khai bao array lưu câu tl
  List<String> selectedAnswers = [];
  var activescreen = 'Start-screen';

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = 'results-screen';
      });
    }
  }

  void restart() {
    setState(() {
      activescreen = 'questions-screen';
      selectedAnswers = [];
    });
  }

  void switchScreen() {
    setState(() {
      activescreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activescreen == 'questions-screen') {
      screenWidget = QuestionCreen(onSelectAnswer: chooseAnswers);
    } else if (activescreen == 'results-screen') {
      screenWidget =
          ResultScreen(choosenAnswers: selectedAnswers, onRestart: restart);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 247, 29, 247),
                Color.fromARGB(255, 255, 229, 96),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
