import '../../data/models/standerd/show_standard_model.dart';



sealed class CreateStandardState {}

final class CreateStandardInitial extends CreateStandardState {}
final class CreateStandardLoading extends CreateStandardState {}
final class CreateStandardSend extends CreateStandardState {}
final class CreateStandardSendStandardGroup extends CreateStandardState {}
final class CreateStandardLoaded extends CreateStandardState {
  final List<ShowStandardsModel> list ;

  CreateStandardLoaded(this.list);
}
