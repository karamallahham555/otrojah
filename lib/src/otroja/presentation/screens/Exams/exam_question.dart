import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/widgets/question_card.dart';
import 'package:admins/src/otroja/presentation/widgets/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/show_students_widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/Exam/show_exam_model.dart';
import '../../widgets/otroja_drop_down.dart';

class ExamQuestion extends StatefulWidget {
  const ExamQuestion({super.key, required this.questions});

  final List<Questions> questions;

  @override
  _QuestionBankState createState() => _QuestionBankState();
}

class _QuestionBankState extends State<ExamQuestion> {
  final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');
  String? selectedSubject; // To store the selected subject

  @override
  Widget build(BuildContext context) {
    print(widget.questions);
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "بنك الأسئلة",
        secText: 'اضغط على الامتحان لعرض تفاصيله',

      ),
      body: Column(
        children: [
          OtrojaSearchBar1(searchNotifier: searchNotifier),
          Expanded(
              child: ValueListenableBuilder<String>(
            valueListenable: searchNotifier,
            builder: (context, searchQuery, _) {
              final filteredQuestions = widget.questions.where((question) {
                final matchesSearchQuery = question.text!
                    .toLowerCase()
                    .contains(searchQuery.toLowerCase());

                return matchesSearchQuery;
              }).toList();

              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: filteredQuestions.length,
                itemBuilder: (context, index) {
                  return QuestionCard(
                    index: index,
                    question: filteredQuestions[index].text!,
                    answers: filteredQuestions[index].answers!,
                    id: filteredQuestions[index].id!,
                    isSelected: false,
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}
