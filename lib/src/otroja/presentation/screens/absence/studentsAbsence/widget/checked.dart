import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../cubit/students/check_student/check_student_cubit.dart';

class Checked extends StatelessWidget {
  Checked({super.key, required this.index, required this.isExit});

  int index;
  int isExit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xff85313C),
          width: 2,
        ),
      ),
      child: isExit == 1
          ? const Icon(Icons.check, color: Colors.green,size: 30,)

              : const Text(''),
    );
  }
}
