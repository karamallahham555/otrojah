import 'dart:convert';
import 'package:admins/src/otroja/core/utils/constants/colors.dart';
import 'package:admins/src/otroja/cubit/Exam_cubit/question_state.dart';
import 'package:admins/src/otroja/data/models/subjects_model.dart';
import 'package:admins/src/otroja/data/models/questinos_model.dart';
import 'package:admins/src/otroja/data/repository/Exam/question_repo.dart';
import 'package:admins/src/otroja/data/repository/subjects_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final SubjectsRepo subjectsRepo;
  final TextEditingController questionController = TextEditingController();
  final List<TextEditingController> answerControllers =
      List.generate(4, (_) => TextEditingController());
  QuestionRepo questionRepo;

  List<SubjectsModel> listSubject = [];
  Map<String, int> subjectsId = {};
  List<String> subjectNames = [];
  int? subjectId;

  QuestionCubit({required this.subjectsRepo, required this.questionRepo})
      : super(const QuestionState()) {
    initialize();
  }

  void initialize() {
    updateControllers();
    loadAllSubjects();
  }

  Future<void> loadAllSubjects() async {
    emit(QuestionSubjectLoading());
    try {
      listSubject = await subjectsRepo.getSubjects();
      print(listSubject);
      print('//////////////////////////');
      mapSubjects(listSubject);
      emit(QuestionSubjectLoaded());
    } catch (e) {
    }
  }

  void mapSubjects(List<SubjectsModel> subjects) {
    for (var subject in subjects) {
      subjectNames.add(subject.name!);
      subjectsId[subject.name!] = subject.id!;
    }
  }

  void addQuestionAnswer(BuildContext context) {
    final isValid = validateQuestionAndAnswers(context);
    if (isValid) {
      print('///////////////////////////// in add');
      print(state.qaList.length);
      final questionModel = createQuestionModel();
      saveQuestionModel(questionModel);
      resetForm();
    }
  }
  bool validateQuestionAndAnswers(BuildContext context) {
    final isQuestionFilled = questionController.text.isNotEmpty;
    final areAnswersFilled = answerControllers.every((controller) => controller.text.isNotEmpty);
    final isAnswerSelected = state.selectedAnswerIndex != -1;
    final isSubjectSelected = subjectId != null;

    if (isQuestionFilled && areAnswersFilled && isAnswerSelected && isSubjectSelected) {
      print(subjectId);
      print(isSubjectSelected);
      return true;
    }

    showErrorMessage(context, isQuestionFilled, areAnswersFilled, isAnswerSelected, isSubjectSelected);
    return false;
  }

  void showErrorMessage(BuildContext context, bool isQuestionFilled, bool areAnswersFilled, bool isAnswerSelected, bool isSubjectSelected) {
    String errorMessage = generateErrorMessage(isQuestionFilled, areAnswersFilled, isAnswerSelected, isSubjectSelected);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: OtrojaColors.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }


  String generateErrorMessage(bool isQuestionFilled, bool areAnswersFilled, bool isAnswerSelected, bool isSubjectSelected) {
    if (!isQuestionFilled) {
      return ". الرجاء ملء حقل السؤال";
    } else if (!areAnswersFilled) {
      return ". الرجاء ملء كافة حقول الإجابة";
    } else if (!isAnswerSelected) {
      return "اختر الإجابة الصحيحة";
    } else if (!isSubjectSelected) {
      return "اختر المادة";
    } else {
      return ". الرجاء ملء كافة الحقول";
    }
  }

  QuestionModel createQuestionModel() {
    final question = questionController.text;
    final answers = List.generate(4, (index) {
      final text = answerControllers[index].text;
      final isCorrect = state.selectedAnswerIndex - 1 == index;
      return AnswerModel(text: text, isCorrect: isCorrect);
    });

    return QuestionModel(
      question: question,
      answers: answers,
    );
  }

  void saveQuestionModel(QuestionModel questionModel) {
    final updatedQaList = List<QuestionModel>.from(state.qaList);

    if (state.currentQuestionIndex < updatedQaList.length) {
      updatedQaList[state.currentQuestionIndex] = questionModel;
    } else {
      updatedQaList.add(questionModel);
    }

    emit(state.copyWith(
      qaList: updatedQaList,
      currentQuestionIndex: state.currentQuestionIndex + 1,
      selectedAnswerIndex: -1,
    ));
    print(state.qaList);
  }

  void selectAnswer(int index) {
    emit(state.copyWith(selectedAnswerIndex: index));
  }

  void goBack() {
    if (state.currentQuestionIndex > 0) {
      final previousQuestionIndex = state.currentQuestionIndex - 1;
      final correctAnswerIndex = state.qaList[previousQuestionIndex].answers
          .indexWhere((answer) => answer.isCorrect);

      emit(state.copyWith(
        currentQuestionIndex: previousQuestionIndex,
        selectedAnswerIndex: correctAnswerIndex != -1
            ? correctAnswerIndex + 1
            : -1, // Adjust if necessary
      ));

      updateControllers();
    }
  }

  void updateControllers() {
    if (state.currentQuestionIndex < state.qaList.length) {
      final currentQuestion = state.qaList[state.currentQuestionIndex];
      questionController.text = currentQuestion.question;
      for (int i = 0; i < answerControllers.length; i++) {
        answerControllers[i].text = currentQuestion.answers[i].text;
      }
      final correctAnswerIndex =
          currentQuestion.answers.indexWhere((answer) => answer.isCorrect);
      emit(state.copyWith(
          selectedAnswerIndex:
              correctAnswerIndex != -1 ? correctAnswerIndex + 1 : -1));
    } else {
      clearControllers();
    }
  }

  void clearControllers() {
    questionController.clear();
    for (var controller in answerControllers) {
      controller.clear();
    }
  }

  Future<void> sendQuestions() async {
    print(state.qaList);
    final data = QuestionAnswersWrapper(
        questionAnswers: state.qaList, subjectId: subjectId);
    try {
      print(data.toJson());
      final response = await questionRepo.postData(data.toJson());
      print(response);

      emit(QuestionSubjectSend());
    } catch (e) {
      print(e);
    }
  }

  void resetForm() {
    clearControllers();
    updateControllers();
  }
}
