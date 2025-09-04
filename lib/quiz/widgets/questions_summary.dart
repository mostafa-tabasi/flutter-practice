import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final userAnswer = data['user_answer'] as String;
            final correctAnswer = data['correct_answer'] as String;

            Color numberBackgroundColor = userAnswer == correctAnswer
                ? Colors.green
                : Colors.red;

            return Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        color: numberBackgroundColor,
                        child: Center(
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(181, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            userAnswer,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 44, 143, 255),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            correctAnswer,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 255, 234, 44),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
