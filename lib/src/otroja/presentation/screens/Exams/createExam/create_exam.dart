import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/createExam/widget/exam_form.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/CustomRoundedButton.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_seccuss_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import '../../../../cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import '../../../../cubit/Exam_cubit/create_exam/create_exam_state.dart';
import '../../../../cubit/Exam_cubit/question_cubit.dart';
import '../../../../cubit/course/course_cubit.dart';
import '../../../../cubit/levelCubit/level_cubit.dart';
import '../../../widgets/OtrojaDatePicker.dart';
import '../../../widgets/add_user/custom_text_field.dart';
import '../../../widgets/buttons/otroja_button.dart';
import '../../../widgets/buttons/save_cancel_button.dart';
import '../../../widgets/custome_snakbar.dart';
import '../../../widgets/otroja_app_bar.dart';

class CreateExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 245, 239),
      appBar: OtrojaAppBar(
        mainText: 'إنشاء امتحان',
      ),
      body: BlocConsumer<CreateExamCubit, CreateExamState>(
        listener: _onStateChange,
        builder: (context, state) {
          return ExamForm();
        },
      ),
    );
  }

  void _onStateChange(BuildContext context, CreateExamState state) {
    if (state is CreateExamSend) {
      _showSuccessDialog(context);
    } else if (state is CreateExamError) {
      _showErrorSnackBar(context, state.message);
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>  OtrojaSuccessDialog(text: "تمت اضافة الامتحان بنجاح"),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      customSnackBar(message),
    );
  }
}

