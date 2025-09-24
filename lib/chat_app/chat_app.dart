import 'package:flutter/material.dart';
import 'package:flutter_practice/chat_app/auth_screen.dart';
import 'package:flutter_practice/shopping_list/shopping_list_screen.dart';

final theme = ThemeData().copyWith(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 63, 17, 177),
  ),
);

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      theme: theme,
      home: const AuthScreen(),
    );
  }
}
