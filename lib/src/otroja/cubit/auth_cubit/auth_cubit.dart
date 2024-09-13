import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/models/auth_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../core/helper/constant.dart';
import '../../core/routing/routes.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  ApiService apiService = ApiService();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  postData(BuildContext context) async {
    try {
      print('///////////////////////');
      emit(AuthLoading());
      final data = AuthModel(
          userName: userNameController.text, password: passwordController.text);

      final response = await apiService.post("login", data: data.toJson());
      emit(AuthSend());
    if(response.statusCode==200){
      print('///////////////////////////');
        context.pushNamed(Routes.home);
      Map<String, dynamic> responseBody = response.data;
      token = responseBody['data']['data']['token'];
    }
   else if(response.statusCode==501){
      print('//////////////////////////////////');

        showDialog(
        context: navigatorKey.currentState!.overlay!.context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("غير مسموح",textAlign: TextAlign.center
              ,),
            content: const Text("Invalid User Name or Password"),
            actions: [
              TextButton(
                child: const Text("عودة"),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Optionally, navigate to the login page or another appropriate action
                },
              ),
            ],
          );
        },
      );

    }
      print(response.statusCode);



      Map<String, dynamic> responseBody = response.data;
      token = responseBody['data']['token'];
    }catch(e){
      print(e);
    }
  

  }
}
