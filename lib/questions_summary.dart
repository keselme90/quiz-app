
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView( // Takes a single child and makes it scrollable
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data['question_index'] as int) + 1).toString()),
                Expanded( // Without Expanced widget Column takes an infinite amount of width, even if it goes beyond the screen boundaries. 
                          // Allows the child to take all avaiable width along the main axis. The widget passed as a child to Exapanded cannot take more width than the Expaned's parent widget.
                  child: Column(children: [
                    Text(data['question'] as String),
                    const SizedBox(height: 5,),
                    Text(data['user_answer'] as String),
                    Text(data['correct_answer'] as String)
                  ],),
                )
              ],
            );
          }).toList(), // map function returns iterable object, so we are converting it to a list
        ),
      ),
    );
  }


}