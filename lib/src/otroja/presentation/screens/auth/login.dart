import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/cubit/auth_cubit/auth_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_circular_progress_indicator.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: 'Login',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    OtrojaTextFormField(label: "اسم المستخدم",
                      controller: cubit.userNameController,),
                    SizedBox(
                      height: 40.h,
                    ),
                    OtrojaTextFormField(label: "كلمة المرور",
                      controller: cubit.passwordController,),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
             if(state is AuthInitial) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OtrojaButton(
                      text: "تسجيل دخول",
                      onPressed: () {
                        print('/////////////');
                        cubit.postData(context);
                      }),
                );
              }else{
               return OtrojaCircularProgressIndicator();
             }
            },
          )
        ],
      ),
    );
  }
}
