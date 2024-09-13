import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import '../../../../../cubit/course/course_cubit.dart';
import '../../../../../cubit/groups/group_cubit.dart';
import '../../../../../cubit/levelCubit/level_cubit.dart';
import '../../../../widgets/otroja_drop_down.dart';
import '../../qustion/widgets/CustomRoundedButton.dart';
class SelectionModeSpecificField extends StatelessWidget {
   SelectionModeSpecificField({super.key,required this.cubit});
  CreateExamCubit cubit;

  Widget build(BuildContext context) {
    if (cubit.isSelectByCourse) {
      return BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          return _buildDropdowns(context);
        },
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: CustomRoundedButton(
              onTap: () {
                context.pushNamed(Routes.groups, arguments: true);
              },
              text: "الحلقات المختارة",
              imagePath: 'assets/images/Group 130.png',
              backgroundColor: Colors.transparent,
              borderColor: OtrojaColors.primaryColor,
              textColor: const Color(0xFF85313C),
            ),
          ),
          Expanded(
            child: CustomRoundedButton(
              onTap: () {
                context.pushNamed(Routes.groups, arguments: false);
              },
              text: "تحديد حلقات الامتحان",
              imagePath: 'assets/images/shalat (1) 1.png',
              backgroundColor: OtrojaColors.primaryColor,
              borderColor: const Color(0xFF85313C),
              textColor: Colors.white,
            ),
          ),
        ],
      );
    }
  }
}
Widget _buildDropdowns(BuildContext context) {
  return Row(
    children: [
      BlocBuilder<LevelCubit, LevelState>(
        builder: (context, state) {
          if (state is LevelLoaded) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: OtrojaDropdown(
                  list: context.read<LevelCubit>().levelsName,
                  labelText: 'المستوى',
                  hint: "اختر مستوى",
                  onChange: (value) {
                    context.read<CreateExamCubit>().courseLevelId=
                        context.read<LevelCubit>().levelsId[value]!;
                    print(context.read<LevelCubit>().levelsId[value]!);
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: OtrojaDropdown(
                list: context.read<CourseCubit>().coursesNames,
                labelText: 'اسم الدورة',
                hint: "اختر دورة",
                onChange: (value) {
                  print('////////////////////////////////////////');

                  context.read<LevelCubit>().getLevelsByCourseId(
                      context.read<CourseCubit>().coursesId[value]!);
                },
              ),
            ),
          );
        },
      ),
    ],
  );
}