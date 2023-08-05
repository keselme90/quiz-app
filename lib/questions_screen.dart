import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
   return SizedBox( // An alternative way to center the elemnts on the screen
    width: double.infinity, // Take as much width as possible
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("The question..."),
        const SizedBox(height: 30,),
        ElevatedButton(onPressed: () {}, child: const Text("Answer 1"))
      ],
     ),
   );
  }

}