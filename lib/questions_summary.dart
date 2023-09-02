
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz_question_number.dart';

class QuestionsSummary extends StatelessWidget {
  
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {

    bool isCorrectAnswer(String userAnswer, String correctAnswer) {
      return userAnswer == correctAnswer;
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView( // Takes a single child and makes it scrollable
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start, // We add this to make sure that the elemnts will be aligned to the top of the row
              children: [
                QuizQuestionNumber(
                  questionIndex: ((data['question_index'] as int) + 1).toString(),
                  isCorrectAnswer: isCorrectAnswer(data['user_answer'] as String, data['correct_answer'] as String)
                ),
                const SizedBox(width: 20,),
                Expanded( // Without Expanced widget Column takes an infinite amount of width, even if it goes beyond the screen boundaries. 
                          // Allows the child to take all avaiable width along the main axis. The widget passed as a child to Exapanded cannot take more width than the Expaned's parent widget.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // We add this to make sure that all text is aligned to the left
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        data['user_answer'] as String,
                        style: const TextStyle(
                          color: Colors.amber
                        )),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                          color: Colors.teal
                        ),)
                    ],
                  ),
                )
              ],
            );
          }).toList(), // map function returns iterable object, so we are converting it to a list
        ),
      ),
    );
  }


}