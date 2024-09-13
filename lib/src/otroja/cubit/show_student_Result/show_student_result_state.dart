part of 'show_student_result_cubit.dart';

@immutable
sealed class ShowStudentResultState {}

final class ShowStudentResultInitial extends ShowStudentResultState {}
final class ShowStudentResultLoading extends ShowStudentResultState {}
final class ShowStudentResultLoaded extends ShowStudentResultState {
  final List<ShowStudentResultModel> list;

  ShowStudentResultLoaded(this.list);
}
