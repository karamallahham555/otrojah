import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/question_header.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/question_instructions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../cubit/Exam_cubit/question_cubit.dart';
import '../../../../../cubit/Exam_cubit/question_state.dart';
import '../../../../widgets/buttons/otroja_button.dart';
import '../../../../widgets/otroja_drop_down.dart';
import '../../../../widgets/otroja_seccuss_dialog.dart';
import 'answer_fields.dart';
import 'navigation_buttons.dart';
import 'question_field.dart';

class QuestionTicket extends StatelessWidget {
  const QuestionTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit, QuestionState>(
      listener: _handleStateChanges,
      builder: (context, state) {
        final cubit = context.read<QuestionCubit>();

        return Card(
          color: const Color(0xFFFFF5EC),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (state.currentQuestionIndex == 0) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: OtrojaDropdown(
                          list: cubit.subjectNames,
                          labelText: 'حدد المادة',
                          hint: "حدد المادة",
                          onChange: (value) =>
                              cubit.subjectId = cubit.subjectsId[value]!,
                        ),
                      ),
                      const Divider(thickness: 2)
                    ],
                    QuestionHeader(
                      state: state,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: LinearProgressIndicator(
                        value:
                            state.currentQuestionIndex / state.totalQuestions,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            OtrojaColors.primaryColor),
                      ),
                    ),
                    QuestionInstructions(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: QuestionField(
                        controller: cubit.questionController,
                        label: "نص السؤال",
                        hintText: "أدخل نص السؤال",
                      ),
                    ),
                    AnswerFields()
                  ],
                ),
              ),
              NavigationButtons(),
              if (state.currentQuestionIndex > 0)
                OtrojaButton(
                  text: "انهاء",
                  onPressed: () {
                    cubit.addQuestionAnswer(context);
                    cubit.sendQuestions();}
                ),
            ],
          ),
        );
      },
    );
  }

  void _handleStateChanges(BuildContext context, QuestionState state) {
    if (state is QuestionSubjectSend) {
      showDialog(
        context: context,
        builder: (context) =>
            OtrojaSuccessDialog(text: "تمت اضافة الاسئلة بنجاح"),
      );
    }
  }
}
