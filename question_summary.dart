import 'package:flutter/material.dart';

class Questionsummary extends StatefulWidget {
  const Questionsummary(this.summary, {super.key});
  final List<Map<String, Object>> summary;

  @override
  State<Questionsummary> createState() {
    return _Questionsummary();
  }
}

class _Questionsummary extends State<Questionsummary> {
  var colour = const Color.fromARGB(192, 217, 76, 66);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: widget.summary.map((data) {
            if (data['Correct_Answer'] == data['Selected_Answer']) {
              colour = Colors.blue;
            } else {
              colour = const Color.fromARGB(192, 217, 76, 66);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: colour),
                  child: Center(
                    child: Text(
                      ((data['Question_Index'] as int) + 1).toString(),
                      style: const TextStyle(
                          color: Color.fromRGBO(67, 9, 96, 1),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['Question_Text'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['Correct_Answer'] as String,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        data['Selected_Answer'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 94, 198, 225)),
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
