import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main(List<String> args) {
  // runAoo is a method is a must method - it actually starts out application.
  runApp(
    const MaterialApp( // MaterialApp is a base widget
      home: Scaffold( // Scaffold allows to set the screen.
        body: StartScreen()
        ),
      )
    );  
}