import 'package:admins/src/otroja/cubit/groups/group_cubit.dart';
import 'package:admins/src/otroja/cubit/show_student_Result/show_student_result_cubit.dart';
import 'package:admins/src/otroja/cubit/show_student_Result/show_student_result_cubit.dart';
import 'package:admins/src/otroja/presentation/screens/Exam/studentPoints/widgets/student_point_item.dart';
import 'package:admins/src/otroja/presentation/widgets/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_circular_progress_indicator.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/Exam_cubit/show_exams/show_exams_cubit.dart';
import '../../widgets/otroja_drop_down.dart';

class StudentPointsScreen extends StatelessWidget {
  StudentPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitGroup = context.read<GroupCubit>();
    final cubitExam = context.read<ShowExamsCubit>();
    final cubitResult = context.read<ShowStudentResultCubit>();
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: " علامات الطالب ",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OtrojaSearchBar(),
            Row(
              children: [
                BlocBuilder<ShowExamsCubit, ShowExamsState>(
                  builder: (context, state) {
                    if (state is ShowExamsLoaded) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: OtrojaDropdown(
                            list: cubitExam.examList,
                            labelText: 'المستوى',
                            hint: "اختر مستوى",
                            onChange: (value) {
                              print(cubitExam.exaNameToIdMap[value]);
                              final examid = cubitExam.exaNameToIdMap[value];
                              print(examid);
                              print(cubitGroup.groupid);
                              cubitResult.getResult(
                                  examid!, cubitGroup.groupid);
                            },
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                BlocBuilder<GroupCubit, GroupState>(
                  builder: (context, state) {
                    return Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: OtrojaDropdown(
                            list: cubitGroup.groupsList, // Pass only the names
                            labelText: 'اسم المجموعة',
                            hint: "اختر مجموعة",
                            onChange: (String? value) {
                              int? selectedGroupId =
                                  cubitGroup.groupNameToIdMap[value];
                              cubitGroup.groupid = selectedGroupId!;
                              print(selectedGroupId);
                              print("Selected Group ID: $selectedGroupId");
                              cubitExam.getExamGroup(selectedGroupId!);
                            },
                          )),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            // TotalPointsWidget(),
            // SizedBox(height: 10.h),
            const Divider(
              color: Color(0xFFE6E6E6),
            ),
            BlocBuilder<ShowStudentResultCubit, ShowStudentResultState>(
              builder: (context, state) {
                if (state is ShowStudentResultLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        return StudentPointItem(
                          value: state.list[index].score!,
                          date: state.list[index].createdAt!,
                          text: state.list[index].student!.firstName!,
                        );
                      },
                    ),
                  );
                } else if (state is ShowStudentResultLoading) {
                  return const Expanded(
                      child: OtrojaCircularProgressIndicator());
                } else {
                  return const Expanded(
                    child: Center(
                      child: Text("الرجاء اختيار المجموعة ثم الامتحان"),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
