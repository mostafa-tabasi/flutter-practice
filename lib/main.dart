import 'package:flutter/material.dart';
import 'package:flutter_practice/dice_roller/dice_roller_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Practice")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [NavigatorButton("Dice Roller", const DiceRollerScreen())],
      ),
    );
  }
}

class NavigatorButton extends StatelessWidget {
  const NavigatorButton(this.title, this.screen, {super.key});

  final String title;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
      child: Text(title),
    );
  }
}
