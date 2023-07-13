import 'package:flutter/material.dart';

class MyGradient extends StatelessWidget {
  const MyGradient({super.key});

  static const colr1 = Colors.blue;
  static const colr2 = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return const CustomGradient(colr1: colr1, colr2: colr2);
  }
}

class CustomGradient extends StatelessWidget {
  const CustomGradient({
    super.key,
    required this.colr1,
    required this.colr2,
  });

  final MaterialColor colr1;
  final MaterialAccentColor colr2;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(colors: [colr1, colr2])
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
    );
  }
}
