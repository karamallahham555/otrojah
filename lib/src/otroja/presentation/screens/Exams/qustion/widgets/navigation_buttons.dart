import 'package:admins/src/otroja/cubit/Exam_cubit/question_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/buttons/otroja_button.dart';
class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<QuestionCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (cubit.state.currentQuestionIndex > 0) _buildPreviousQuestionButton(cubit),
        Expanded(
          child: OtrojaButton(
            text: "السؤال التالي",
            onPressed: () => cubit.addQuestionAnswer(context),
          ),
        ),
      ],
    );
  }
}
Widget _buildPreviousQuestionButton(QuestionCubit cubit) {
  return Expanded(
    child: InkWell(
      onTap: cubit.goBack,
      child: Container(
        margin: const EdgeInsets.all(4),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: const Color(0xFF85313C), width: 2),
        ),
        child: const Center(
          child: Text(
            "السؤال السابق",
            style: TextStyle(color: Color(0xFF85313C), fontSize: 20),
          ),
        ),
      ),
    ),
  );
}