class CreateExamModel {
  String name;
  var subjectId;
  String date;
  List<int> questionIds;
  var duration;
  List<int> groupIds;
  var courseLevelId;

  CreateExamModel({
    required this.name,
    required this.subjectId,
    required this.date,
    required this.questionIds,
    required this.duration,
    required this.groupIds,
    required this.courseLevelId,
  });

  factory CreateExamModel.fromJson(Map<String, dynamic> json) {
    return CreateExamModel(
      name: json['name'] as String,
      subjectId: json['subject_id'] as String,
      date: json['date'],
      questionIds: List<int>.from(json['question_ids[]'] as List),
      duration: json['duration'] as int,
      groupIds: List<int>.from(json['group_ids[]'] as List),
      courseLevelId: json['course_level_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subject_id': subjectId,
      'date': date,
      'question_ids': questionIds,
      'duration': duration,
      if (groupIds.isNotEmpty) 'group_ids': groupIds,
      if (courseLevelId != null) 'course_level_id': courseLevelId,
    };
  }
}
