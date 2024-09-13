import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/group_model.dart';
import 'package:dio/dio.dart';

class GroupRepository {
  final ApiService _apiService;

  GroupRepository(this._apiService);

  Future<List<Group>> getGroups() async {
    final response = await _apiService.get('groups/all');
    final List<dynamic> data = response.data['data'];
    return data.map((json) => Group.fromJson(json)).toList();
  }

Future<List<Group>> getAllGroups() async {
    try {
      final response = await _apiService.get('all_groups');
      if (response.data['status'] == 200) {
        final List<dynamic> groupsData = response.data['data'];
        return groupsData.map((json) => Group.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch groups: ${response.data['msg']}');
      }
    } catch (e) {
      throw Exception('Failed to fetch groups: $e');
    }
  }
  Future<List<Group>> getGroupsByCourseLevel(int courseLevelId) async {
    final response =
        await _apiService.get('groups',queryParameters:  {'course_level_id': courseLevelId.toString()});
    final List<dynamic> data = response.data['data'];
    return data.map((json) => Group.fromJson(json)).toList();
  }

  Future<Group> getGroupById(int id) async {
    final response = await _apiService.get('groups/$id');
    return Group.fromJson(response.data);
  }

  Future<int> createGroupWithStudents(Group group) async {
    try {
      final response = await _apiService.post(
        'group/create_with_students',
        data: group.toJson(),
      );
      return response.data['status'];
    } catch (e) {
      throw Exception('Failed to create group: $e');
    }
  }

  Future<Group> updateGroup(int id, Group group) async {
    final response = await _apiService.put('groups/$id', data: group.toJson());
    return Group.fromJson(response.data);
  }

  Future<void> deleteGroup(int id) async {
    await _apiService.delete('groups/$id');
  }

  Future<void> addStudentToGroup(int studentId, int groupId) async {
    try {
      await _apiService.post('student/group/add', data: {
        'student_id': studentId.toString(),
        'group_id': groupId.toString(),
      });
    } catch (e) {
      throw Exception('Failed to add student to group: $e');
    }
  }
}
