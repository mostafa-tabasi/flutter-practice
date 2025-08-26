import 'package:flutter_practice/dice_roller/dice_roller.dart';
import 'package:flutter/material.dart';

const startAlignment = AlignmentGeometry.topLeft;
const endAlignment = AlignmentGeometry.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  // an alternative construction function
  GradientContainer.bluePurple({super.key})
    : colors = [Color.fromARGB(213, 63, 0, 88), Color.fromARGB(199, 22, 1, 95)];

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child:
          // Center(child: StyledText('Hello World!')),
          Center(child: DiceRoller()),
    );
  }
}
