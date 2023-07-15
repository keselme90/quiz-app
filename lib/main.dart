import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
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
          child: const StartScreen(),
        ),
      ),
    )
  );
}
