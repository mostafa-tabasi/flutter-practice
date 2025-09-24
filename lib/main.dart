import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/chat_app/chat_app.dart';
import 'package:flutter_practice/dice_roller/dice_roller_screen.dart';
import 'package:flutter_practice/expense_tracker/expenses_screen.dart';
import 'package:flutter_practice/favorite_places/favorite_places_app.dart';
import 'package:flutter_practice/firebase_options.dart';
import 'package:flutter_practice/meals/meals_app.dart';
import 'package:flutter_practice/quiz/quiz_screen.dart';
import 'package:flutter_practice/shopping_list/shopping_list_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  /*
  // To lock the rotation on Portrait only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    onValue,
  ) {
    runApp(const MyApp());
  });
  */

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      backgroundColor: const Color.fromARGB(255, 50, 50, 50),
      appBar: AppBar(
        title: const Text(
          "Flutter Practice",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 77, 76, 76),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          NavigatorButton("Dice Roller", const DiceRollerScreen()),
          NavigatorButton("Quiz App", const QuizScreen()),
          NavigatorButton("Expense Tracker", const ExpensesScreen()),
          NavigatorButton("Meals App", ProviderScope(child: const MealsApp())),
          NavigatorButton("Shopping List", const ShoppingListApp()),
          NavigatorButton(
            "Favorite Places",
            ProviderScope(child: const FavoritePlacesApp()),
          ),
          NavigatorButton("Chat App", const ChatApp()),
        ],
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
