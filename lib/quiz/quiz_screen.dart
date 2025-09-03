import 'package:flutter/material.dart';
import 'package:flutter_practice/quiz/data/questions.dart';
import 'package:flutter_practice/quiz/questions_screen.dart';
import 'package:flutter_practice/quiz/result_screen.dart';
import 'package:flutter_practice/quiz/start_screen.dart';

const _startScreenId = "start-screen";
const _questionsScreenId = "questions-screen";
const _resultScreenId = "result-screen";

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  var activeScreenId = _startScreenId;
  List<String> choosenAnswers = [];

  Widget getActiveScreen() {
    Widget activeScreenWirget;

    switch (activeScreenId) {
      case _startScreenId:
        activeScreenWirget = StartScreen(
          onStartQuiz: navigateToQuestionsScreen,
        );
        break;

      case _questionsScreenId:
        activeScreenWirget = QuestionsScreen(onSelectAnswer: chooseAnswer);
        break;

      case _resultScreenId:
      default:
        activeScreenWirget = ResultScreen(
          selectedAnswers: choosenAnswers,
          onRestartQuiz: restartQuiz,
        );
        break;
    }

    return activeScreenWirget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 107, 126, 0),
              Color.fromARGB(255, 0, 86, 37),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: getActiveScreen(),
      ),
    );
  }

  void navigateToQuestionsScreen() {
    setState(() {
      activeScreenId = _questionsScreenId;
    });
  }

  void chooseAnswer(String answer) {
    choosenAnswers.add(answer);

    if (questionsFinished) {
      navigateToResultScreen();
    }
  }

  bool get questionsFinished => choosenAnswers.length >= questions.length;

  void navigateToResultScreen() {
    setState(() {
      activeScreenId = _resultScreenId;
    });
  }

  void restartQuiz() {
    choosenAnswers = [];
    navigateToQuestionsScreen();
  }
}
