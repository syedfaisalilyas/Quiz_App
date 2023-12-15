import 'package:flutter/material.dart';
import 'package:quiz_app/answerbutton.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.addanswer,
  });

  final void Function(String answer) addanswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentquestionindex = 0;

  void changequestionindex(String selectedanswer) {
    widget.addanswer(selectedanswer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentquestionindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 177, 114, 214),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentquestion.getsshuffledList().expand((answer) {
              return [
                AnswerButton(
                    answertext: answer,
                    onTap: () {
                      changequestionindex(answer);
                    }),
                const SizedBox(height: 10), // Adjust the height as needed
              ];
            }).toList()
          ],
        ),
      ),
    );
  }
}
