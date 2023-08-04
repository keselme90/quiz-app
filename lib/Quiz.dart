import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

import 'Questions.dart';

class Quiz extends StatefulWidget {
  
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState  extends State<Quiz> {

  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() { 
    setState(()  { // Set state is a function that's provieded by extending State class.
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context)  {
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
          child: activeScreen,
        ),
      ),
    );
  }

}