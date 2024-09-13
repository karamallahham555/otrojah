import 'package:admins/src/otroja/core/helper/extensions.dart';
import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/cubit/standard/create_standard_cubit.dart';
import 'package:admins/src/otroja/presentation/screens/standards/widgets/standard_card.dart';
import 'package:admins/src/otroja/presentation/widgets/add_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/otroja_app_bar.dart';
import 'package:admins/src/otroja/presentation/widgets/show_students_widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/activityCubit/show_activity/show_activity_cubit.dart';
import '../../../cubit/standard/create_standard_state.dart';
import '../../widgets/otroja_circular_progress_indicator.dart';
import '../activity/showActivities/widgets/activity_item.dart';
import '../tasme3/widgets/standard_item.dart';

class ShowStandard extends StatelessWidget {
  const ShowStandard({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> searchNotifier = ValueNotifier<String>('');
    final cubit = context.read<CreateStandardCubit>();

    return Scaffold(
        appBar: OtrojaAppBar(
          mainText: 'عرض العاير',
          optionalWidget: AddAppBar(
            onTap: () {
              context.pushNamed(Routes.createStandard).then((_) {
                cubit.list.clear();
                cubit.getStandard();
              });
            },
          ),
        ),
        body: Column(
          children: [
            OtrojaSearchBar1(searchNotifier: searchNotifier),
            BlocBuilder<CreateStandardCubit, CreateStandardState>(
              builder: (BuildContext context, state) {
                if (state is CreateStandardLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StandardCard(
                            activityTitle: state.list[index].name!,
                            activityOtroja: state.list[index].scoreDeduct!, isAdd: false,
                            isInList: false, onAdd: (){}, remove: (){},
                          ),
                        );
                      },
                      itemCount: state.list.length,
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: OtrojaCircularProgressIndicator(),
                    ),
                  );
                }
              },
            )
          ],
        ));
  }
}
