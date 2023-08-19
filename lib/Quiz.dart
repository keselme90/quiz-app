import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

import 'questions_screen.dart';

class Quiz extends StatefulWidget {
  
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState  extends State<Quiz> {

  Widget? activeScreen;
  var currentScreen = 'start-screen';
  final List<String> selectedAnswers = [];

  @override
  void initState() { // Executed by Flutter when the StatefulWidget's State object is initialized
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentScreen = 'results-screen';
      });
    }
  }

    void switchScreen() { 
      setState(()  { // Set state is a function that's provieded by extending State class.
        // activeScreen = const QuestionsScreen(chooseAnswer);
        currentScreen = 'questions-screen';
      });
  }

  void onRetakQuiz() {
    setState(() {
      currentScreen = 'start-screen';
      selectedAnswers.clear(); // Clear the ansers list so we can retake the quiz.
    });
  }

  @override
  Widget build(BuildContext context)  { // Executed by Flutter when the Widget is built for the first time AND after setState() was called

    final screenWidget = currentScreen == 'start-screen' // We can use conditions to decide which screen we want to render.
              ? StartScreen(switchScreen)
              : currentScreen == 'questions-screen'
                ? QuestionsScreen(onAnswer: chooseAnswer,)
                : ResultsScreen(answers: selectedAnswers, questions: questions, onRetakQuiz:onRetakQuiz,);

    return MaterialApp(
      home: Scaffold( // Doesn't take any space by itself
        body: Container( // Doesn't take any space by itself
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              colors: [
                Color.fromARGB(255, 74, 26, 156),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }

}