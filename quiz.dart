import 'package:flutter/material.dart';
import 'package:quiz_app/questio_screen.dart';
import 'package:quiz_app/starter_screen.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz_state();
  }
}

class _Quiz_state extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedanswers = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenwidget = startscreen(switchScreen);

    void restart() {
      setState(() {
        selectedanswers = [];
        activeScreen = 'question-screen';
      });
    }

    void chooseanswer(String answer) {
      selectedanswers.add(answer);
      if (selectedanswers.length == questions.length) {
        setState(() {
          activeScreen = 'results-screen';
        });
      }
    }

    if (activeScreen == 'question-screen') {
      screenwidget = QuestionScreen(addanswer: chooseanswer);
    }
    if (activeScreen == 'results-screen') {
      screenwidget = Resultscreen(
        chooseanswers: selectedanswers,
        onRestart: restart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 82, 16, 110),
              Color.fromRGBO(67, 9, 96, 1)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
