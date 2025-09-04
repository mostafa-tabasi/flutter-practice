import 'package:flutter/material.dart';
import 'package:flutter_practice/quiz/data/questions.dart';
import 'package:flutter_practice/quiz/widgets/questions_summary.dart';
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
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = getSummaryData().where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!",
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(181, 255, 255, 255),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              QuestionsSummary(getSummaryData()),
              const SizedBox(height: 40),
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

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }

    return summary;
  }
}
