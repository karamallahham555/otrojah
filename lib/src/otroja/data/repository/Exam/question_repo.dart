import 'package:admins/src/otroja/data/datasource/api_services.dart';

import '../../../cubit/Exam_cubit/question_state.dart';

class QuestionRepo{
  ApiService apiService;

  QuestionRepo(this.apiService);
  postData( dynamic data)async {

    try {
      final response = await apiService.post(
        'questions/questions_answers',
        data: data

      );
      if(response.statusCode==201){
      return response;}
      else{
        print('/////////////////////////////////////////// ${response.statusCode}');
      }


    } catch (e) {
      print(e);
    }
  }
}