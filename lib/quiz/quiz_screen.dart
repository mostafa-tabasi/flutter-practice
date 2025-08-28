import 'package:flutter/material.dart';
import 'package:flutter_practice/quiz/questions_screen.dart';
import 'package:flutter_practice/quiz/start_screen.dart';

const _startScreenId = "start-screen";
const _questionsScreenId = "questions-screen";

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  var activeScreen = _startScreenId;

  void switchScreen() {
    setState(() {
      activeScreen = _questionsScreenId;
    });
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
        child: activeScreen == _startScreenId
            ? StartScreen(switchScreen)
            : QuestionsScreen(),
      ),
    );
  }
}
