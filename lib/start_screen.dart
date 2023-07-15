import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center( // Centers its child widget inside of it horizontaly and verticaly, by taking as much space as it can
      child: Column(
        mainAxisSize: MainAxisSize.min, // Take only as minimum vertical vertical space as needed
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 80,
          ),
          const Text( // Takes as much space as it needs for the content
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 199, 182, 236), fontSize: 24
            ),
          ) ,
          const SizedBox(height: 80),
          OutlinedButton(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {},
            child: const Text('Start Quiz'))
        ],
      )
    );
  }
}