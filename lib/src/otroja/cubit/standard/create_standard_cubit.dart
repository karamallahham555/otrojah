import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/api_services.dart';
import '../../data/models/standerd/show_standard_model.dart';
import 'create_standard_state.dart';
import 'package:flutter/material.dart';

class CreateStandardCubit extends Cubit<CreateStandardState> {
  CreateStandardCubit() : super(CreateStandardInitial()) {
    getStandard();
    getTest();
  }

  final List<ShowStandardsModel> list = <ShowStandardsModel>[];
  final List<int> addedIds = <int>[]; // Track added IDs

  TextEditingController name = TextEditingController();
  TextEditingController scoreDeduct = TextEditingController();

  ApiService apiService = ApiService();

  postData() async {
    emit(CreateStandardLoading());
    final data = {"name": name.text, "score_deduct": scoreDeduct.text};
    await apiService.post('standards/create', data: data);
    emit(CreateStandardSend());
  }

  getStandard() async {
    emit(CreateStandardLoading());
    try {
      final response = await apiService.get('standards');
      final responseBody = response.data;
      list.clear();
      for (var data in responseBody) {
        list.add(ShowStandardsModel.fromJson(data));
      }
      emit(CreateStandardLoaded(list));
    } catch (e) {
      print(e);
    }
  }

  void addToList(int id) {
    if (!addedIds.contains(id)) {
      addedIds.add(id);
      emit(CreateStandardLoaded(list)); // Re-emit the state to refresh UI

    }
    emit(CreateStandardLoaded(list)); // Re-emit the state to refresh UI
  }
  void removeFromList(int id) {
    if (addedIds.contains(id)) {
      addedIds.remove(id);
    }
    emit(CreateStandardLoaded(list));


  }
  int groupId=0;
  postStandardGroup()
   async{
    emit(CreateStandardLoading());

    final data={
      "group_id":groupId,
      "standard_ids":addedIds
    };
    print(data);
    await apiService.post('standards/group', data: data);

    emit(CreateStandardSendStandardGroup());
    emit(CreateStandardLoaded(list));

    print(data);
    print('//////////////////////////////////////////////////////');
  }
  getTest() async{
    final response = await apiService.get('results/exam_groups',queryParameters: {
      "group_id":10,
      "exam_id":1
    });
    final responseBody = response.data;
    print('////////////////////////////////////////////// zed');
    print(responseBody);
  }

}
