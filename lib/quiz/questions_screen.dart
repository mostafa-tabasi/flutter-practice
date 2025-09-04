import 'package:flutter/material.dart';
import 'package:flutter_practice/quiz/widgets/answer_button.dart';
import 'package:flutter_practice/quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

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
                color: Color.fromARGB(172, 255, 255, 255),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                text: answer,
                onPressed: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }
}
