import 'package:admins/src/otroja/data/datasource/api_services.dart';

import '../../models/student_model/show_student_result.dart';

class ShowStudentResultRepo {
  ApiService apiService;

  ShowStudentResultRepo(this.apiService);

  Future<List<ShowStudentResultModel>> getResult(int exam, int group) async {
    final response = await apiService.get("results/exam_groups",
        queryParameters: {"group_id": group, "exam_id": exam});

    if (response.statusCode == 200) {
      print('............................... zed');
      final responseData = response.data;

      List<ShowStudentResultModel> questions = [];
      // responseData.map((json) => ShowStudentResultModel.fromJson(json)).toList();
      print(questions.runtimeType);
      for (var data in responseData) {
        questions.add(ShowStudentResultModel.fromJson(data));
      }
      print(questions);

      return questions;
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
