import 'package:flutter/material.dart';
import 'package:flutter_practice/quiz_app/start_screen.dart';

class QuizAppScreen extends StatelessWidget {
  const QuizAppScreen({super.key});

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
        child: StartScreen(),
      ),
    );
  }
}
