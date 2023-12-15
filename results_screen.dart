import 'package:flutter/material.dart';
import 'package:quiz_app/data/quiz_questions.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class Resultscreen extends StatelessWidget {
  const Resultscreen(
      {super.key, required this.chooseanswers, required this.onRestart});
  final void Function() onRestart;
  final List<String> chooseanswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chooseanswers.length; i++) {
      summary.add({
        'Question_Index': i,
        'Question_Text': questions[i].text,
        'Correct_Answer': questions[i].answers[0],
        'Selected_Answer': chooseanswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numofques = questions.length;
    final numofcorques = summarydata.where((data) {
      return data['Correct_Answer'] == data['Selected_Answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numofcorques out of $numofques questions correctly!',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 177, 114, 214),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Questionsummary(summarydata),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz !'),
            )
          ],
        ),
      ),
    );
  }
}
