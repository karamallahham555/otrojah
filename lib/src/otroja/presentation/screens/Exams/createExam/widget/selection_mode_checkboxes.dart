import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../cubit/Exam_cubit/create_exam/create_exam_cubit.dart';

class SelectionModeCheckboxes extends StatelessWidget {
  SelectionModeCheckboxes({super.key, required this.cubit});
  final CreateExamCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: CheckboxListTile(
            title: const Text("تحديد حسب الدورة"),
            value: cubit.isSelectByCourse,
            onChanged: (value) => cubit.toggleSelectMode(true),
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(OtrojaColors.primaryColor), // Corrected here
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: CheckboxListTile(
            title: const Text("تحديد حسب المجموعة"),
            value: !cubit.isSelectByCourse,
            onChanged: (value) => cubit.toggleSelectMode(false),
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(OtrojaColors.primaryColor), // Corrected here
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }
}