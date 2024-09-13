


import 'package:admins/src/otroja/cubit/Exam_cubit/question_bank/question_bank_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/question/question_bank_repo.dart';

class QuestionBankCubit extends Cubit<QuestionBankState> {
  final QuestionBankRepository repository;

  QuestionBankCubit( this.repository) : super(QuestionInitial()){
    loadQuestions();
  }

  void loadQuestions() async {
    try {
      emit(QuestionLoading());
      final questions = await repository.fetchQuestions();
      print(questions);
      print('/////////////////////////////////////////');
      print(questions);

      emit(QuestionLoaded(questions));
    } catch (e) {
      print('///////////////////////////////////');
      print(e);
      emit(QuestionError(e.toString()));
    }
  }
}
