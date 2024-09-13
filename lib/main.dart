import 'package:admins/src/otroja/core/di/dependency_injection.dart';
import 'package:admins/src/otroja/core/routing/app_router.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/show_exams/show_exams_cubit.dart';
import 'package:admins/src/otroja/cubit/groups/group_cubit.dart';
import 'package:admins/src/otroja/cubit/show_student_Result/show_student_result_cubit.dart';
import 'package:admins/src/otroja/data/datasource/api_services.dart';
import 'package:admins/src/otroja/data/repository/group_repository.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/show_studnet_result_repo.dart';
import 'package:admins/src/otroja/presentation/screens/Exam/student_point_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  setUpGetIt();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set the status bar color to transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Optionally, set status bar icons to dark
    ));

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              title: 'Flutter Demo',
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'DIN Next LT Arabic',
              ),
              onGenerateRoute: appRouter.generateRoute,
              // home: MultiBlocProvider(
              //   providers: [
              //     BlocProvider(
              //       create: (context) => getIt<ShowExamsCubit>(),
              //     ),
              //     BlocProvider(
              //       create: (context) => GroupCubit(GroupRepository(ApiService()))..getGroups(),
              //     ),
              //
              //     BlocProvider(
              //       create: (context) => ShowStudentResultCubit(ShowStudentResultRepo(ApiService())),
              //     ),
              //   ],
              //   child: StudentPointsScreen(),
              // )
          );
        });
  }
}
