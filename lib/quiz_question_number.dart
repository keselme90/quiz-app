import 'package:flutter/material.dart';

class QuizQuestionNumber extends StatelessWidget {
  
  final bool isCorrectAnswer;
  final String questionIndex;

  const QuizQuestionNumber({required this.questionIndex, required this.isCorrectAnswer, super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCorrectAnswer ?
        Colors.blueAccent :
        Colors.pinkAccent,
      ),
      child: Text(
          questionIndex,
          style: const TextStyle(
              color: Color.fromARGB(255, 199, 182, 236),
              fontSize: 20
            ),
          ),
      );
    }
  }

      // return Center(
    //   child: CircleAvatar(
    //     backgroundColor: isCorrectAnswer ? Colors.blueAccent : Colors.pinkAccent,
    //     radius: 10,
    //     child: Text(
    //       questionNumber,
    //       style: const TextStyle(
    //           color: Color.fromARGB(255, 199, 182, 236),
    //           fontSize: 18
    //         ),
    //       ),
    //     ),
    //   );