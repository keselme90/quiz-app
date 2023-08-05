import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  
  final VoidCallback onPress;
  final String text;
  
  // const AnswerButton(this.text, this.onPress, {super.key}); // This is an example of positional Constructor
  const AnswerButton({ super.key, required this.text, required this.onPress}); // This is na example of name Constructor

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(40)
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)
      ),
      child: Text(text)
      );
  }

}