import 'package:admins/src/otroja/data/models/Exam/show_exam_model.dart';
import 'package:admins/src/user/widget_question/question_body_user.dart';
import 'package:admins/src/user/widget_question/question_header_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../otroja/presentation/widgets/buttons/otroja_button.dart';
import '../../otroja/presentation/widgets/otroja_seccuss_dialog.dart';
import '../take_exam_user_cubit/take_exam_user_cubit.dart';
import '../take_exam_user_cubit/take_exam_user_state.dart';
import 'navigation_buttons_user.dart';

class QuestionTicketUser extends StatelessWidget {
  const QuestionTicketUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakeExamUserCubit, TakeExamUserState>(
      listener: (context, state) {
        if (state is TakeExamUserFinishExam) {
          print("////////////////////${state.correctAnswers}");
          _showExamFinishedDialog(context, state);
        }
      },
      builder: (context, state) {
        final cubit = context.read<TakeExamUserCubit>();
        final currentQuestion = state.qaList[state.currentQuestionIndex];
        print(currentQuestion);

        return Card(
          color: const Color(0xFFFFF5EC),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              QuestionHeaderUser(state: state),
              QuestionBodyUser(
                  currentQuestion: currentQuestion, state: state, cubit: cubit),
              NavigationButtonsUser(state: state, cubit: cubit),
              if (state.isExamFinished) _buildResultsButton(cubit),
            ],
          ),
        );
      },
    );
  }
  void _showExamFinishedDialog(BuildContext context, TakeExamUserFinishExam state) {
    showDialog(
      context: context,
      builder: (context) => OtrojaSuccessDialog(
        text:
            "تم إنهاء الامتحان. لقد أجبت على ${state.correctAnswers} من أصل ${state.total} إجابات صحيحة.",
      ),
    );
  }

  Widget _buildResultsButton(TakeExamUserCubit cubit) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OtrojaButton(
        text: "عرض النتائج",
        onPressed: () {

        },
      ),
    );
  }
}
