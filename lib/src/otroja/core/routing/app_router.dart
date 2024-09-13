import 'package:admins/src/otroja/core/routing/routes.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/create_exam/create_exam_cubit.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_bank/question_bank_cubit.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_cubit.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/show_exams/show_exams_cubit.dart';
import 'package:admins/src/otroja/cubit/absecne_staff/absence_staff_cubit.dart';
import 'package:admins/src/otroja/cubit/activityCubit/show_activity/show_activity_cubit.dart';
import 'package:admins/src/otroja/cubit/parentCubit/parent_cubit.dart';
import 'package:admins/src/otroja/cubit/permissionCubit/permission_cubit.dart';
import 'package:admins/src/otroja/cubit/recite/recite_cubit.dart';
import 'package:admins/src/otroja/cubit/standard/create_standard_cubit.dart';
import 'package:admins/src/otroja/cubit/students/check_student/check_student_cubit.dart';
import 'package:admins/src/otroja/cubit/subjectCubit/subject_cubit.dart';
import 'package:admins/src/otroja/data/models/Exam/show_exam_model.dart';
import 'package:admins/src/otroja/data/models/course_model.dart';
import 'package:admins/src/otroja/data/models/permission_model.dart';
import 'package:admins/src/otroja/data/models/student_model/show_students.dart';
import 'package:admins/src/otroja/data/repository/level_repository.dart';
import 'package:admins/src/otroja/data/repository/parent_repository.dart';
import 'package:admins/src/otroja/data/repository/permission_repository.dart';
import 'package:admins/src/otroja/data/repository/recite_repository.dart';
import 'package:admins/src/otroja/data/repository/standard_repository.dart';
import 'package:admins/src/otroja/data/repository/students_rpeos/show_students_repo.dart';
import 'package:admins/src/otroja/data/repository/subject_repository.dart';
import 'package:admins/src/otroja/presentation/screens/Courses/AddCourses/addCoursesScreen.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/examDetails/exam_details.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/exam_question.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/question_bank.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/qustion/qustion.dart';
import 'package:admins/src/otroja/presentation/screens/Exams/showExams/show_exams.dart';
import 'package:admins/src/otroja/presentation/screens/Home/homePage.dart';
import 'package:admins/src/otroja/presentation/screens/activity/addActivity/addActivityScreen.dart';
import 'package:admins/src/otroja/presentation/screens/activity/showActivities/activityScreen.dart';
import 'package:admins/src/otroja/presentation/screens/standards/create_standard.dart';
import 'package:admins/src/otroja/presentation/screens/student/edit_information_student.dart';
import 'package:admins/src/otroja/presentation/screens/student/student_details.dart';
import 'package:admins/src/otroja/presentation/screens/subject/show_subjects/show_subject.dart';
import 'package:admins/src/user/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../user/take_exam_user_cubit/take_exam_user_cubit.dart';
import '../../../user/widget_question/data/exam_argument.dart';
import '../../cubit/EditStudentCubit/edit_student_cubit.dart';
import '../../cubit/activityCubit/add_activity/add_activity_cubit.dart';
import '../../cubit/announcement/add_announcement.dart';
import '../../cubit/announcement/show_announcement_cubit.dart';
import '../../cubit/auth_cubit/auth_cubit.dart';
import '../../cubit/course/course_cubit.dart';
import '../../cubit/groups/group_cubit.dart';
import '../../cubit/levelCubit/level_cubit.dart';
import '../../cubit/staff/staff_cubit.dart';
import '../../cubit/standardCubit/standard_cubit.dart';
import '../../cubit/studentInfoCubit/student_info_cubit.dart';
import '../../cubit/students/add_studnet/cubit/add_student_cubit.dart';
import '../../cubit/students/show_student_cubit/show_students_cubit.dart';
import '../../data/datasource/api_services.dart';
import '../../data/models/stuednt_info.dart';
import '../../data/repository/course_repository.dart';
import '../../data/repository/group_repository.dart';
import '../../data/repository/staff_repository.dart';
import '../../data/repository/student_info_repository.dart';
import '../../data/repository/students_rpeos/edit_info_student_repo.dart';
import '../../presentation/screens/Exam/studentPoints/student_points.dart';
import '../../presentation/screens/Exams/createExam/create_exam.dart';
import '../../presentation/screens/absence/absencesDays/absence_for_Group.dart';
import '../../presentation/screens/absence/absencesDays/absences_by_group.dart';
import '../../presentation/screens/announcement/Announcement_page.dart';
import '../../presentation/screens/auth/login.dart';
import '../../presentation/screens/management/management_screen.dart';
import '../../presentation/screens/Courses/ShowCourses/show_courses.dart';
import '../../presentation/screens/Groups/ShowGroups/GroupsScreen.dart';
import '../../presentation/screens/Groups/addGroup/add_group.dart';
import '../../presentation/screens/Groups/addStudentToGroup/add_student_to_group_screen.dart';
import '../../presentation/screens/Groups/groupStudents/group_students_screen.dart';
import '../../presentation/screens/Levels/levels.dart';
import '../../presentation/screens/absence/studentsAbsence/checkStudentsScreen.dart';
import '../../presentation/screens/absence/teachersAbsence/checkGroupsScreen.dart';
import '../../presentation/screens/parents/addParents/add_parents.dart';
import '../../presentation/screens/parents/showPerants/show_perants.dart';
import '../../presentation/screens/permissions/ShowAuthorizedAdmins/show_authorized_admins.dart';
import '../../presentation/screens/permissions/ShowPermissions/show_permissions_screen.dart';
import '../../presentation/screens/staff/add_staff.dart';
import '../../presentation/screens/staff/showStaff/show_staff_screen.dart';
import '../../presentation/screens/standards/add_standard_group.dart';
import '../../presentation/screens/standards/show_standard.dart';
import '../../presentation/screens/student/add_student.dart';
import '../../presentation/screens/student/show_students.dart';
import '../../presentation/screens/subjectOrGroups/subject_or_group_screen.dart';
import '../../presentation/screens/tasme3/tasmeaaScreen.dart';
import '../../presentation/screens/tasme3/widgets/show_students_recit.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  ShowStudentsCubit showStudentsCubit =
      ShowStudentsCubit(ShowStudentsRepo(ApiService()));
  StandardCubit standardCubit = StandardCubit(StandardRepository(ApiService()));
  GroupCubit groupCubit = GroupCubit(GroupRepository(ApiService()));
  SubjectCubit subjectCubit = SubjectCubit(SubjectRepository(ApiService()));
  LevelCubit levelCubit = LevelCubit(LevelRepository(ApiService()));
  PermissionCubit permissionCubit =
      PermissionCubit(PermissionRepository(ApiService()));
  StaffCubit staffCubit = StaffCubit(StaffRepository(ApiService()));
  StudentInfoCubit studentInfoCubit =
      StudentInfoCubit(StudentRepository(ApiService()));

  ParentCubit parentCubit = ParentCubit(ParentRepository(ApiService()));

  CourseCubit courseCubit = CourseCubit(CourseRepository(ApiService()));

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(),
            child: Login(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AnnouncementCubit1()..fetchAnnouncements(),
            child: HomePage(),
          ),
        );
      case Routes.announcementPage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AnnouncementFormCubit(),
              ),
              BlocProvider(
                create: (context) => AnnouncementCubit1()..fetchAnnouncements(),
              ),
            ],
            child: AnnouncementPage(),
          ),
        );

      case Routes.addCourses:
        levelCubit.getAllLevels();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          CourseCubit(CourseRepository(ApiService())),
                    ),
                    BlocProvider.value(
                      value: levelCubit,
                    ),
                  ],
                  child: AddCourses(),
                ));

      case Routes.showStudentsRecite:
        showStudentsCubit.getStudents();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: showStudentsCubit,
                    ),
                    BlocProvider.value(
                      value: standardCubit,
                    ),
                  ],
                  child: ShowStudentsRecite(),
                ));

      case Routes.tasmeaa:
        standardCubit.getStandards();
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          ReciteCubit(ReciteRepository(ApiService())),
                    ),
                    BlocProvider.value(
                      value: standardCubit,
                    ),
                  ],
                  child: TasmeaaScreen(),
                ));

      case Routes.showLevels:
        final List<Level> levels = settings.arguments as List<Level>;

        return MaterialPageRoute(
            builder: (_) => ShowLevels(
                  levels: levels,
                ));

      case Routes.subjectOrGroup:
        final int courseLevelId = settings.arguments as int;
        groupCubit.getGroupByCourseLevel(courseLevelId);
        subjectCubit.getSubjectsByCourseLeve(courseLevelId);
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: groupCubit,
                    ),
                    BlocProvider.value(
                      value: subjectCubit,
                    ),
                  ],
                  child: SubjectOrGroupScreen(
                    courseLevelId: courseLevelId,
                  ),
                ));

      case Routes.showCourses:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      CourseCubit(CourseRepository(ApiService())),
                  child: ShowCourses(),
                ));

      case Routes.addParents:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: parentCubit,
                  child: AddParents(),
                ));

      case Routes.showStudents:
        showStudentsCubit.getStudents();
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowStudentsCubit>(),
                  child: ShowStudents(),
                ));

      case Routes.checkStudents:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<CheckStudentCubit>(),
                  child: CheckStudentScreen(),
                ));

      case Routes.checkGroups:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<AbsenceStaffCubit>(),
                    ),
                    BlocProvider.value(
                      value: courseCubit,
                    ),
                  ],
                  child: CheckGroupsScreen(),
                ));

      case Routes.addGroup:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: showStudentsCubit,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    StaffCubit(StaffRepository(ApiService()))..getTeachers(),
              ),
              BlocProvider(
                create: (context) =>
                    CourseCubit(CourseRepository(ApiService())),
              ),
              BlocProvider(
                create: (context) => GroupCubit(GroupRepository(ApiService())),
              ),
            ],
            child: AddGroup(),
          ),
        );

      case Routes.addStudentToGroup:
        showStudentsCubit.getStudents();
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: showStudentsCubit,
                child: const AddStudentToGroupScreen()));

      case Routes.showParents:
        parentCubit.fetchAllParents();
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: parentCubit, child: ShowParentsScreen()));

      case Routes.groupStudents:
        final groupId = settings.arguments as int;
        showStudentsCubit.getStudentsByGroupId(groupId);
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: showStudentsCubit,
                  child: GroupStudentsScreen(
                    groupId: groupId,
                  ),
                ));

      case Routes.groups:
        final isSelectedGroup = settings.arguments as bool;

        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          CourseCubit(CourseRepository(ApiService())),
                    ),
                    BlocProvider.value(
                      // create: (context)=>GroupCubit(GroupRepository(ApiService())),
                      value: groupCubit,
                    ),
                    BlocProvider.value(
                      // create: (context)=>GroupCubit(GroupRepository(ApiService())),
                      value: levelCubit,
                    ),
                    BlocProvider.value(
                      // create: (context)=>GroupCubit(GroupRepository(ApiService())),
                      value: getIt<CreateExamCubit>(),
                    ),
                  ],
                  child: GroupsScreen(
                    isSelectedGroup: isSelectedGroup,
                  ),
                ));

      case Routes.addActivity:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<AddActivityCubit>(),
                child: const AddActivityScreen()));

      case Routes.activity:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<ShowActivityCubit>(),
                child: ActivityScreen()));

      case Routes.studentDetails:
        final ShowStudentModel? showStudentModel =
            settings.arguments as ShowStudentModel?;
        studentInfoCubit.fetchStudentInfo(showStudentModel!.id!);
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: studentInfoCubit,
                  child: StudentDetails(
                    showStudentModel: showStudentModel,
                  ),
                ));
      case Routes.studentAbsencsForGroup:
        final absences = settings.arguments as List<Absence>;
        return MaterialPageRoute(
            builder: (_) => StudentAbsencsForGroup(absence: absences));
      case Routes.studentAbsencsByGroup:
        final absences = settings.arguments as List<Absence>;
        return MaterialPageRoute(
            builder: (_) => AbsenceDayesScreen(absence: absences));
      case Routes.studentPoints:
        final result = settings.arguments as List<Result>;
        return MaterialPageRoute(
            builder: (_) => StudentPointsScreen(results: result));
      case Routes.editStudentInfo:
        final student = settings.arguments as ShowStudentModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      EditStudentCubit(EditInfoStudentRepo(ApiService())),
                  child: EditInformationStudent(
                    student: student,
                  ),
                ));

      // return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //           create: (context) => getIt<EditInfoStudentCubit>(),
      //           child: EditInformationStudent(
      //             studentId: studentId,
      //           ),
      //         ));

      case Routes.showAuthorizedAdmins:
        final permission = settings.arguments as Permission;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: staffCubit,
                    ),
                    BlocProvider(
                      create: (context) =>
                          PermissionCubit(PermissionRepository(ApiService())),
                    ),
                  ],
                  child: ShowAuthorizedAdminsScreen(
                    permission: permission,
                  ),
                ));

      case Routes.addStudent:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          GroupCubit(GroupRepository(ApiService()))
                            ..fetchAllGroups(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          AddStudentCubit(ShowStudentsRepo(ApiService())),
                    ),
                    BlocProvider.value(value: parentCubit)
                  ],
                  child: AddStudent(),
                ));

      case Routes.question:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<QuestionCubit>(),
                  child: const Question(),
                ));
      case Routes.addStaff:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      StaffCubit(StaffRepository(ApiService())),
                  child: AddStaff(),
                ));
      case Routes.showSubject:
        return MaterialPageRoute(builder: (_) => ShowSubject());

      case Routes.managemet:
        return MaterialPageRoute(builder: (_) => ManagemetScreen());
      case Routes.createExam:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CreateExamCubit>(),
              ),
              BlocProvider(
                  create: (context) => CourseCubit(
                        CourseRepository(ApiService()),
                      )),
              BlocProvider(create: (context) => levelCubit),
              BlocProvider(create: (context) => getIt<QuestionCubit>()),
            ],
            child: CreateExam(),
          ),
        );
      case Routes.questionBank:
        final bool isAdd = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<CreateExamCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => getIt<QuestionBankCubit>(),
                    ),
                  ],
                  child: QuestionBank(
                    isAdd: isAdd,
                  ),
                ));
      case Routes.showExams:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ShowExamsCubit>()..getExams(),
                  child: ShowExams(),
                ));
      case Routes.examDetails:
        ShowExamsModel showExamsModel = settings.arguments as ShowExamsModel;

        return MaterialPageRoute(
          builder: (_) => ExamDetails(
            showExamsModel: showExamsModel,
          ),
        );
      case Routes.questionUser:
        final ExamArguments args = settings.arguments as ExamArguments;
        List<Questions> questionList = args.showExamsModel;
        int examId = args.examId;
        var duration = args.duration;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                TakeExamUserCubit()..initialize(questionList, examId, duration),
            child: const QuestionUser(),
          ),
        );
      case Routes.examQuestion:
        final List<Questions> args = settings.arguments as List<Questions>;
        print(args);
        return MaterialPageRoute(
          builder: (_) => ExamQuestion(
            questions: args,
          ),
        );

      case Routes.showStaff:
        staffCubit.getAllStaff();
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: staffCubit,
                  child: ShowStaffScreen(),
                ));
      case Routes.createStandard:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CreateStandardCubit(),
                  child: CreateStandard(),
                ));
      case Routes.addStandardGroup:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CreateStandardCubit(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          GroupCubit(GroupRepository(ApiService()))
                            ..getGroups(),
                    ),
                  ],
                  child: AddStandardGroup(),
                ));
      case Routes.studentPointsScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CreateStandardCubit(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          GroupCubit(GroupRepository(ApiService()))
                            ..getGroups(),
                    ),
                  ],
                  child: AddStandardGroup(),
                ));
        case Routes.showPermissions:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => PermissionCubit(PermissionRepository(ApiService()))..getPermissions(),
                    ),

                  ],
                  child: ShowPermissionsScreen(),
                ));
        case Routes.showStandard:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CreateStandardCubit()..getStandard(),
                    ),

                  ],
                  child: ShowStandard(),
                ));
    }

    return null;
  }
}
