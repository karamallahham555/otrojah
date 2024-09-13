import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/Exam/show_exam_model.dart';
import '../../../data/repository/Exam/show_exam_repo.dart';

part 'show_exams_state.dart';

class ShowExamsCubit extends Cubit<ShowExamsState> {
  ShowExamsCubit(this.showExamsRepo) : super(ShowExamsInitial()){

    // getExams();
    // getExamGroup(1);
  }
  int groupId=0;
  ShowExamRepo showExamsRepo;

  getExams() async {
    try {
      emit(ShowExamsLoading());
      final List<ShowExamsModel> response = await showExamsRepo.showExams();

      emit(ShowExamsLoaded(response));
    } catch (e) {
      emit(ShowExamsError(e.toString()));
    }
  }
  List<String> examList=[];

  // Store only group names
  Map<String, int> exaNameToIdMap = {};
  getExamGroup(int groupId) async{
    try {
      emit(ShowExamsLoading());
      final List<ShowExamsModel> response = await showExamsRepo.showExamsFroGroup(groupId);
      print(response);
      examList.clear();
      exaNameToIdMap.clear();

      response.forEach((exam) {
        examList.add(exam.name!);
        exaNameToIdMap[exam.name!] = exam.id!;
      });

      emit(ShowExamsLoaded(response));
    } catch (e) {
      emit(ShowExamsError(e.toString()));
    }
  }
}
