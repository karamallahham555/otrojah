class ShowStudentResultModel {
  int? id;
  int? examId;
  int? studentId;
  int? score;
  String? createdAt;
  String? updatedAt;
  Student? student;

  ShowStudentResultModel(
      {this.id,
        this.examId,
        this.studentId,
        this.score,
        this.createdAt,
        this.updatedAt,
        this.student});

  ShowStudentResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    studentId = json['student_id'];
    score = json['score'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exam_id'] = this.examId;
    data['student_id'] = this.studentId;
    data['score'] = this.score;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  int? userId;
  int? parentId;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? grade;
  String? address;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.id,
        this.userId,
        this.parentId,
        this.firstName,
        this.lastName,
        this.birthDate,
        this.grade,
        this.address,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    parentId = json['parent_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthDate = json['birth_date'];
    grade = json['grade'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['parent_id'] = this.parentId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['birth_date'] = this.birthDate;
    data['grade'] = this.grade;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}