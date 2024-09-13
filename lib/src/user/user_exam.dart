// import 'package:admins/src/otroja/data/models/Exam/show_exam_model.dart';
// import 'package:admins/src/otroja/presentation/screens/Exams/examDetails/widget/details_ticket.dart';
// import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/enhanced_circular_indicator.dart';
// import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
// import 'package:admins/src/user/widget/user_exam.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../otroja/core/utils/constants/colors.dart';
// import '../otroja/presentation/screens/Exams/qustion/widgets/question_background.dart';
//
//
// class UserExam extends StatelessWidget {
//
//   UserExam( {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> instructions = [
//       "لاختيارك الإجابة الصحيحة لسؤال ما فقط قم بالضغط على رقمها",
//       " لا يمكنك إعادة الامتحان بعد الضغط على زر التقدم للامتحان",
//       'انتبه إلى مدة الامتحان والزمن المتبقي أعلى الشاشة',
//       ' عند الانتهاء من الاجابة اضغط زر إنهاء الامتحان'
//     ];
//
//     // Create a list of rows dynamically based on the texts provided
//     List<Widget> buildRows(List<String> texts) {
//       return texts.map((text) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: Text(
//                     text,
//                     textAlign: TextAlign.end,
//                     style: TextStyle(fontSize: 14.sp),
//                   ),
//                 ),
//               ),
//               const EnhancedCircularIndicator(),
//             ],
//           ),
//         );
//       }).toList();
//     }
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           const QuestionBackground(),
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.1),
//                   Padding(
//                     padding: EdgeInsets.only(right: 20, left: 20, bottom: 30.h),
//                     child:  DetailsTicketUser(),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 50.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             " : الرجاء قراءة التعليمات الاتية ",
//                             style: TextStyle(color: OtrojaColors.primaryColor),
//                           ),
//                         ),
//                         ...buildRows(instructions),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: OtrojaButton(
//                         text: "التقدم للامتحان",
//                         onPressed: () {
//                         }),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
