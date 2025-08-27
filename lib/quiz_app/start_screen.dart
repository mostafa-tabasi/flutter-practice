import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/quiz-logo.png", width: 200),
          SizedBox(height: 40),
          Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          SizedBox(height: 40),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            child: Text("Start quiz", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
