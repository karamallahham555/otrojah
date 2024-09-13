import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/createExam/widget/selection_mode_checkboxes.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/createExam/widget/selection_mode_specific_field.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/CustomRoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_drop_down.dart';

import '../../../../../cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import '../../../../../cubit/Exam_cubit/question_cubit.dart';
import '../../../../widgets/add_user/custom_text_field.dart';
import '../../../../widgets/buttons/otroja_button.dart';
import '../../qustion/widgets/otroja_time_picker_widget.dart';
import 'exam_duration_and_date.dart';

class ExamForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateExamCubit>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ExamDurationAndDate(),
            OtrojaTimePickerWidget(
              hintText: 'الوقت',
              labelText: 'وقت الامتحان',
              // containerColor: OtrojaColors.primaryColor,
              containerWidth: double.infinity,
              borderThickness: 2,
              borderColor: OtrojaColors.primaryColor,
              imagePath: '',
              textDirection: TextDirection.rtl,
              onTimeSelected: (TimeOfDay) {
                print('${TimeOfDay.hour}:${TimeOfDay.minute}:00');
                cubit.formatTimeOfDay(TimeOfDay);


              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: OtrojaDropdown(
                list: context.read<QuestionCubit>().subjectNames,
                labelText: 'حدد المادة',
                hint: "حدد المادة",
                onChange: (value) {
                  final cubit = context.read<CreateExamCubit>();
                  cubit.subjectId =
                      context.read<QuestionCubit>().subjectsId[value]!;
                },
              ),
            ),
            CustomTextFormField(
              labelText: ' عنوان الامتحان',
              onChange: (data) {},
              hintText: "اكتب عنوان الامتحان",
              prefixIcon: Transform.scale(
                scale: 0.60,
                child: Icon(
                  Icons.note,
                  color: const Color(0xFFE6E6E6),
                  size: 30.sp,
                ),
              ),
              myController: cubit.examNameController,
            ),
            SelectionModeCheckboxes(
              cubit: cubit,
            ),
            SizedBox(height: 20.h),
            SelectionModeSpecificField(
              cubit: cubit,
            ),
            SizedBox(height: 20.h),
            CustomRoundedButton(
              onTap: () {
                context.pushNamed(Routes.questionBank, arguments: true);
              },
              text: "اختيار من بنك الأسئلة",
              imagePath: 'assets/images/exam (4) 1.png',
              backgroundColor: Colors.transparent,
              borderColor: OtrojaColors.primaryColor,
              textColor: const Color(0xFF85313C),
            ),
            SizedBox(height: 40.h),
            OtrojaButton(
              text: "إضافة الامتحان",
              onPressed: () {
                cubit.submit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
