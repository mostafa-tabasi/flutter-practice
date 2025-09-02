import 'package:flutter/material.dart';
import 'package:flutter_practice/quiz/answer_button.dart';
import 'package:flutter_practice/quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  List<String> chosenAnswers = List.empty(growable: true);
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                text: answer,
                onPressed: () {
                  if (currentQuestionIndex + 1 < questions.length) {
                    answerQuestion(answer);
                  } else {
                    // todo: navigate to result screen
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void answerQuestion(String answer) {
    chosenAnswers.add(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }
}
