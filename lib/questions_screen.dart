import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  
  final void Function(String answer) onAnswer;
  
  const QuestionsScreen({super.key, required this.onAnswer});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion (String answer) {
    widget.onAnswer(answer); // widget is a special state property that gives access to the Screeb class properties.
    setState(() {
      currentQuestionIndex ++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex]; 

    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox( // An alternative way to center the elemnts on the screen
        width: double.infinity, // Take as much width as possible
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Items will strexch out to be as wide as possible
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 197, 129, 241),
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(text: item, onPress: () {
                answerQuestion(item);
              });
            })
          ],
        ),
      ),
    );
  }

}