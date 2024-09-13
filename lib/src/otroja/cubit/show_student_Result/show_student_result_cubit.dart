import 'package:admins/src/otroja/data/repository/students_rpeos/show_studnet_result_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/student_model/show_student_result.dart';

part 'show_student_result_state.dart';

class ShowStudentResultCubit extends Cubit<ShowStudentResultState> {
  ShowStudentResultCubit(this.showStudentResultRepo) : super(ShowStudentResultInitial()){
  }
  ShowStudentResultRepo showStudentResultRepo;
   getResult(int Exam ,int Group) async{
     emit(ShowStudentResultLoading());
     try{
       final response = await showStudentResultRepo.getResult(Exam,Group);
       print('///////////////////////////');
       print(response);
      emit(ShowStudentResultLoaded(response));
     }catch(e)
     {
       print(e);
    }

   }

}
