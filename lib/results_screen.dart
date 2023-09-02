import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  
  final List<QuizQuestion> questions;
  final List<String> answers;
  final VoidCallback onRetakQuiz;

  const ResultsScreen({ super.key,  required this.questions, required this.answers, required this.onRetakQuiz }); // We add required for the name argument because the are optional by default

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < answers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': answers[i] 
        }
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectQuestions = summaryData.where((element) => element['user_answer'] == element['correct_answer']).length;

    return SizedBox( // An alternative way to center the elemnts on the screen
        width: double.infinity, // Take as much width as possible
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $numberOfCorrectQuestions out of $numberOfTotalQuestions question correctly',
                style:GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                  ),
              ),
              const SizedBox(height: 30,),
              QuestionsSummary(summaryData),
              const SizedBox(height: 30,),
              OutlinedButton.icon(onPressed: onRetakQuiz,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.refresh),
                label: const Text('Retake Quiz!')
              ),
            ]
          )
        ) 
      );
  }
}