import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubit/Exam_cubit/question_cubit.dart';
import 'answer_field.dart';
class AnswerFields extends StatelessWidget {
  const AnswerFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit =context.read<QuestionCubit>();
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "إجابات السؤال",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AnswerField(
                controller: cubit.answerControllers[index],
                index: index + 1,
              ),
            ),
          ),
        ],
      );
  }
}
