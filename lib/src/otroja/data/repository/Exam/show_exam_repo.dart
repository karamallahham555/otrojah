import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/Exam/show_exam_model.dart';

class ShowExamRepo {
  ApiService apiService;

  ShowExamRepo(this.apiService);

  Future<List<ShowExamsModel>> showExams() async {
    try {
      final response = await apiService.get('exams');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        List<dynamic> examsJson = responseData['data'];
        return examsJson.map((json) => ShowExamsModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load Exams: ${e}');
    }
  }
  Future<List<ShowExamsModel>> showExamsFroGroup(int groupId) async {
    try {
      final response = await apiService.get('results/group/$groupId');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        List<dynamic> examsJson = responseData['data'];
        print('///////////////// zed ');
        print(examsJson);
        print('///////////////// zed ');

        return examsJson.map((json) => ShowExamsModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load exams");
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load Exams: ${e}');
    }
  }
}
