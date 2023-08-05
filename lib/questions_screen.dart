import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
class QuestionsScreen extends StatefulWidget {
  
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion () {
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
              style: const TextStyle(
                color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(text: item, onPress: answerQuestion);
            })
          ],
        ),
      ),
    );
  }

}