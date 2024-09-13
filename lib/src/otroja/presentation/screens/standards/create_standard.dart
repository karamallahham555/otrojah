import 'package:admins/src/otroja/cubit/standard/create_standard_cubit.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_seccuss_dialog.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/standard/create_standard_state.dart';

class CreateStandard extends StatelessWidget {
  const CreateStandard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateStandardCubit>();
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: "اضافة معيار",
      ),
      body: BlocConsumer<CreateStandardCubit, CreateStandardState>(
        listener: (context, state) {
          if (state is CreateStandardSend) {
            showDialog(
              context: context,
              builder: (context) => OtrojaSuccessDialog(
                text: "!تم إضافة المعيار بنجاح",
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      OtrojaTextFormField(
                        label: "اسم المعيار ",
                        controller: cubit.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OtrojaTextFormField(
                        label: " نسبة الخصم ",
                        controller: cubit.scoreDeduct,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                OtrojaButton(
                    text: "اضافة",
                    onPressed: () {
                      cubit.postData();
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
