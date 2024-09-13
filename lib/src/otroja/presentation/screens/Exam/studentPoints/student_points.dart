import 'package:admins/src/otroja/presentation/widgets/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_search_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/stuednt_info.dart';
import 'widgets/student_point_item.dart';
import 'widgets/total_points_widget.dart';

class StudentPointsScreen extends StatelessWidget {
  List<Result> results;
  StudentPointsScreen({super.key,required this.results});

  @override
  Widget build(BuildContext context) {
    print('/////////////////////////////////////////////');
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
            SizedBox(height: 10.h),
            // TotalPointsWidget(),
            // SizedBox(height: 10.h),
            Divider(
              color: Color(0xFFE6E6E6),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  print(results);
                  print('//////////////////////////');
                  return StudentPointItem(
                    value: results[index].score!,
                    date: results[index].createdAt! ,
                    text: results[index].examName!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}