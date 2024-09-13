import 'package:admins/src/otroja/presentation/screens/standards/widgets/standard_card.dart';
import 'package:admins/src/otroja/presentation/widgets/buttons/otroja_button.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/show_students_widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/groups/group_cubit.dart';
import '../../../cubit/standard/create_standard_cubit.dart';
import '../../../cubit/standard/create_standard_state.dart';
import '../../widgets/otroja_circular_progress_indicator.dart';
import '../../widgets/otroja_drop_down.dart';
import '../../widgets/otroja_seccuss_dialog.dart';

class AddStandardGroup extends StatelessWidget {
  const AddStandardGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> searchNotifier = ValueNotifier<String>('');
    final cubit = context.read<CreateStandardCubit>();
    return Scaffold(
      appBar: OtrojaAppBar(
        mainText: 'اضافة معايير الى مجموعة',
      ),
      body: BlocConsumer<CreateStandardCubit, CreateStandardState>(
        listener: (context, state) {
          if(state is CreateStandardSendStandardGroup){
            showDialog(
              context: context,
              builder: (context) => OtrojaSuccessDialog(
                text: "!تم إضافة المعيار بنجاح",
              ),
            );
          }

        },
        builder: (context, state) {
          return Column(
            children: [
              OtrojaSearchBar1(searchNotifier: searchNotifier),
              BlocBuilder<GroupCubit, GroupState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: OtrojaDropdown(
                              list: context
                                  .read<GroupCubit>()
                                  .groupsList, // Pass only the names
                              labelText: 'اسم المجموعة',
                              hint: "اختر مجموعة",
                              onChange: (String? value) {
                                int? selectedGroupId = context
                                    .read<GroupCubit>()
                                    .groupNameToIdMap[value];
                                cubit.groupId = selectedGroupId!;
                                print(cubit.groupId);
                              },
                            )),
                      ),
                    ],
                  );
                },
              ),
              BlocBuilder<CreateStandardCubit, CreateStandardState>(
                builder: (BuildContext context, state) {
                  if (state is CreateStandardLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final item = state.list[index];
                          final isInList = cubit.addedIds.contains(item.id);

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StandardCard(
                              activityTitle: item.name!,
                              activityOtroja: item.scoreDeduct!,
                              isAdd: true,
                              // Assuming you want the Add button visible
                              isInList: isInList,
                              onAdd: () {
                                print('//////////////////');

                                cubit.addToList(item.id!);
                              },
                              remove: () {
                                print(isInList);
                                print('///////////////////////////////');
                                cubit.removeFromList(item.id!);
                              },
                            ),
                          );
                        },
                        itemCount: state.list.length,
                      ),
                    );
                  }
                  if(state is CreateStandardLoading) {
                    return const Expanded(
                      child: Center(
                        child: OtrojaCircularProgressIndicator(),
                      ),
                    );
                  }
                  else{
                    return Container();
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OtrojaButton(
                    text: "اضافة",
                    onPressed: () {
                      cubit.postStandardGroup();
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
