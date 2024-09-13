import 'package:admins/src/otroja/cubit/Exam_cubit/create_exam/create_exam_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import '../../../../widgets/OtrojaDatePicker.dart';
import '../../../../widgets/otroja_text_field.dart';
class ExamDurationAndDate extends StatelessWidget {
  const ExamDurationAndDate({super.key});

  @override
  Widget build (BuildContext context) {
    final cubit=context.read<CreateExamCubit>();
    return Row(
      children: [
        Expanded(
          child: OtrojaTextFormField(
            label: 'مدة الامتحان',
            hintText: 'حدد المدة',
            prefixIcon: "assets/icons/timer (1) 1.png",
            controller: cubit.durationController,
            type: TextInputType.number,
          ),
        ),
        Expanded(
          child: OtrojaDatePickerWidget(
            labelText: 'التاريخ',
            hintText: ' تاريخ التفقد',
            containerColor: const Color(0xffffffff),
            containerWidth: 340.w,
            borderThickness: 2,
            borderColor: const Color(0xffE6E6E6),
            imagePath: 'assets/icons/calendar.png',
            textDirection: TextDirection.rtl,
            onDateSelected: (picked) {
              String formattedDate =
                  "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
              cubit.dateExam=formattedDate;
            },
          ),
        ),
      ],
    );
  }
}
