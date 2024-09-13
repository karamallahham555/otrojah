import 'package:admins/src/otroja/data/models/group_model.dart';
import 'package:admins/src/otroja/data/repository/group_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/staff_model.dart';
part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final GroupRepository repository;

  String? groupName;
  Staff? selectedTeacher;
  String? selectedCourseName;
  int? selectedCourseLevelId;
  List<int> selectedStudents = [];

  GroupCubit(this.repository) : super(GroupInitial()){
  }
  List<String> groupsList=[];
  int groupid=0;

  // Store only group names
  Map<String, int> groupNameToIdMap = {}; // Store group names with their IDs

  Future<void> getGroups() async {
    print('////////////////');
    emit(GroupLoading());
    try {
      List<Group> groups = await repository.getGroups();
      print(groups);

      // Clear the list before adding new data
      groupsList.clear();
      groupNameToIdMap.clear();

      groups.forEach((group) {
        groupsList.add(group.name);
        groupNameToIdMap[group.name] = group.id!;
      });

      emit(GroupsAllGroupsLoaded(groups));
    } catch (e) {
      emit(GroupError(e.toString()));
    }
  }

  Future<void> getGroupByCourseLevel(int id) async {
    emit(GroupLoading());
    try {
      final groups = await repository.getGroupsByCourseLevel(id);
      print(groups);

      emit(GroupsLoaded(groups));
    } catch (e) {
      print(e);
      emit(GroupError(e.toString()));
    }
  }

  Future<void> getGroupById(int id) async {
    emit(GroupLoading());
    try {
      final group = await repository.getGroupById(id);
      emit(GroupLoaded(group));
    } catch (e) {
      emit(GroupError(e.toString()));
    }
  }

  // Future<void> createGroup(Group group) async {
  //   emit(GroupLoading());
  //   try {
  //     final createdGroup = await repository.createGroup(group);
  //     print(createdGroup);
  //     emit(GroupLoaded(createdGroup));
  //   } catch (e) {
  //     emit(GroupError(e.toString()));
  //   }
  // }
  Future<void> createGroupWithStudents(Group group) async {
    try {
      await repository.createGroupWithStudents(group);
      emit(GroupCreated());
    } catch (e) {
      emit(GroupError(e.toString()));
    }
  }

  Future<void> updateGroup(int id, Group group) async {
    emit(GroupLoading());
    try {
      final updatedGroup = await repository.updateGroup(id, group);
      emit(GroupLoaded(updatedGroup));
    } catch (e) {
      emit(GroupError(e.toString()));
    }
  }

  // Future<void> deleteGroup(int id) async {
  //   emit(GroupLoading());
  //   try {
  //     await repository.deleteGroup(id);
  //     await getGroups(); // Refresh the list after deletion
  //   } catch (e) {
  //     emit(GroupError(e.toString()));
  //   }
  // }

  Future<void> addStudentToGroup(int studentId, int groupId) async {
    emit(GroupLoading());
    try {
      await repository.addStudentToGroup(studentId, groupId);
      emit(StudentAddedToGroup());
    } catch (e) {
      emit(GroupError(e.toString()));
    }
  }


Future<void> fetchAllGroups() async {
    emit(GroupLoading());
    try {
      final groups = await repository.getAllGroups();
      emit(GroupsLoaded(groups));
    } catch (e) {
      emit(GroupError(e.toString()));
    }
  }
  void resetState() {
    groupName = null;
    selectedTeacher = null;
    selectedCourseName = null;
    selectedCourseLevelId = null;
    emit(GroupInitial());
  }
}
