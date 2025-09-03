import 'package:flutter/material.dart';
import 'package:flutter_practice/quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestartQuiz,
  });

  final List<String> selectedAnswers;
  final void Function() onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "You answered ${getCorrectAnswersAmount()} out of ${questions.length} questions correctly!",
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(181, 255, 255, 255),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ...selectedAnswers.map(
                (answer) => Text(
                  answer,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(height: 40),
              OutlinedButton.icon(
                onPressed: onRestartQuiz,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: Icon(Icons.refresh),
                label: Text("Restart Quiz!", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getCorrectAnswersAmount() {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      // the first option is always the correct answer (index 0)
      if (questions[i].answers[0] == selectedAnswers[i]) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }
}
