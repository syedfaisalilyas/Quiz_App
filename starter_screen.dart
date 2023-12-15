import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class startscreen extends StatelessWidget {
  const startscreen(this.QuizStarter, {super.key});

  final void Function() QuizStarter;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          height: 300,
          color: const Color.fromARGB(69, 1, 6, 62),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Flutter is way of fun',
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 177, 114, 214), fontSize: 20),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: QuizStarter,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
      ],
    ));
  }
}
