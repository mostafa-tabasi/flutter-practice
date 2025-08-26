import 'package:flutter/material.dart';
import 'package:flutter_practice/dice_roller/gradient_container.dart';

class DiceRollerScreen extends StatelessWidget {
  const DiceRollerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GradientContainer.bluePurple());
  }
}
