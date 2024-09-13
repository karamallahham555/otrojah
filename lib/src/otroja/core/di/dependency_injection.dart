import 'package:admins/src/otroja/cubit/Exam_cubit/question_cubit.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/show_exams/show_exams_cubit.dart';
import 'package:admins/src/otroja/cubit/activityCubit/show_activity/show_activity_cubit.dart';
import 'package:admins/src/otroja/cubit/add_staff/add_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/students/check_student/check_student_cubit.dart';
import 'package:admins/src/otroja/data/repository/Exam/create_exam_repo.dart';
import 'package:admins/src/otroja/data/repository/Exam/question_repo.dart';
import 'package:admins/src/otroja/data/repository/Exam/show_exam_repo.dart';
import 'package:admins/src/otroja/data/repository/absence/absence_repo.dart';
import 'package:admins/src/otroja/data/repository/absence/absence_staff_repo.dart';
import 'package:admins/src/otroja/data/repository/activity_repos/add_activity_repo.dart';
import 'package:admins/src/otroja/data/repository/activity_repos/show_activity_repo.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/edit_info_student_repo.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/createExam/create_exam.dart';
import 'package:admins/src/otroja/presentation/screens/activity/addActivity/addActivityScreen.dart';
import 'package:get_it/get_it.dart';

import '../../cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import '../../cubit/Exam_cubit/question_bank/question_bank_cubit.dart';
import '../../cubit/absecne_staff/absence_staff_cubit.dart';
import '../../cubit/activityCubit/add_activity/add_activity_cubit.dart';
import '../../cubit/students/add_studnet/cubit/add_student_cubit.dart';
import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../data/datasource/api_services.dart';
import '../../data/repository/question/question_bank_repo.dart';
import '../../data/repository/students_rpeos/show_students_repo.dart';
import '../../data/repository/subjects_repo.dart';

final getIt=GetIt.instance;
Future<void> setUpGetIt()async{
  ApiService apiServices = ApiService();
  getIt.registerLazySingleton<ShowStudentsRepo>(() => ShowStudentsRepo(apiServices));
  getIt.registerLazySingleton<ShowStudentsCubit>(() => ShowStudentsCubit( getIt()));

  // edit information
  // getIt.registerFactory<EditInfoStudentRepo>(() => EditInfoStudentRepo(apiServices));
  // getIt.registerFactory<EditInfoStudentCubit>(()=>EditInfoStudentCubit(getIt()));


  getIt.registerFactory<AddStaffCubit>(()=>AddStaffCubit());
  // Add Activity
  getIt.registerFactory<AddActivityRepo>(()=>AddActivityRepo(apiServices));
  getIt.registerFactory<AddActivityCubit>(()=>AddActivityCubit(getIt()));

  //// show activity
  getIt.registerFactory<ShowActivityRepo>(()=>ShowActivityRepo(apiServices));
  getIt.registerFactory<ShowActivityCubit>(()=>ShowActivityCubit(getIt()));


  //check student
  getIt.registerFactory<AbsenceRepo>(()=>AbsenceRepo(apiServices));
  getIt.registerFactory<CheckStudentCubit>(()=>CheckStudentCubit(getIt()));


  //check staff
  getIt.registerFactory<AbsenceStaffRepo>(()=>AbsenceStaffRepo(apiServices));
  getIt.registerFactory<AbsenceStaffCubit>(()=>AbsenceStaffCubit(getIt()));

  // question
  getIt.registerFactory<SubjectsRepo>(()=>SubjectsRepo(apiServices));
  getIt.registerFactory<QuestionRepo>(()=>QuestionRepo(apiServices));
  getIt.registerFactory<QuestionCubit>(()=>QuestionCubit(subjectsRepo: getIt(),questionRepo: getIt()));

  // question bank

  getIt.registerFactory<QuestionBankRepository>(()=>QuestionBankRepository(apiServices));
  getIt.registerFactory<QuestionBankCubit>(()=>QuestionBankCubit(getIt()));

  //create exam
  getIt.registerFactory<CreateExamRepo>(()=>CreateExamRepo(apiServices));
  getIt.registerFactory<CreateExamCubit>(()=>CreateExamCubit(getIt()));

  // show exams
  getIt.registerFactory<ShowExamRepo>(()=>ShowExamRepo(apiServices));
  getIt.registerFactory<ShowExamsCubit>(()=>ShowExamsCubit(getIt()));








}