import 'package:flutter/material.dart';

import '../../../../../cubit/Exam_cubit/question_state.dart';
  class QuestionHeader extends StatelessWidget {
   QuestionHeader({super.key,required this.state});
  QuestionState state;
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "السؤال ${state.currentQuestionIndex + 1}",
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
