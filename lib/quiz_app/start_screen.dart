import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 40),
          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.arrow_right_alt),
            label: Text("Start quiz", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
