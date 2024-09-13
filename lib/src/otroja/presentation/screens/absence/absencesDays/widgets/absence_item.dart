import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AbsenceItem extends StatelessWidget {
  
  final String date;
  final String groupName;

  const AbsenceItem({
    super.key,
    required this.date,
    required this.groupName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF85313C), width: 2.w),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                    fontWeight: FontWeight.w500 ,fontSize: 18),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Image.asset(
                    "assets/icons/calendar(2).png",
                    scale: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}