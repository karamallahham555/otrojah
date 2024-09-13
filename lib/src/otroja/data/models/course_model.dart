class Course {
   var id;
var name;
 var startDate;
  final DateTime createdAt;
  final DateTime updatedAt;
   List<Level> levels;

  Course(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.levels,
      required this.startDate});

  String get highestLevelOrGeneral {
    if (levels.any((level) => level.name == "عام")) {
      return "عام";
    }

    int highestLevel = 0;
    for (var level in levels) {
      int? levelNumber = int.tryParse(level.name);
      if (levelNumber != null && levelNumber > highestLevel) {
        highestLevel = levelNumber;
      }
    }

    return highestLevel > 0 ? highestLevel.toString() : levels.first.name;
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      startDate: json['start_date'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      levels: (json['levels'] as List<dynamic>)
          .map((levelJson) => Level.fromJson(levelJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_date': startDate,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'levels': levels.map((level) => level.toJson()).toList(),
    };
  }
}

class Level {
 var id;
  var name;
  final LevelPivot? pivot;

  Level({
    required this.name,
    this.id,
    this.pivot,
  });

   factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'] != null ? json['id'] : null,
      name: json['name'],
      pivot: json['pivot'] != null ? LevelPivot.fromJson(json['pivot']) : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pivot': pivot?.toJson(),
    };
  }
}
class LevelPivot {
  var courseId;
  var levelId;
  var id;

  LevelPivot({
    required this.id,
    required this.courseId,
    required this.levelId,
  });

  factory LevelPivot.fromJson(Map<String, dynamic> json) {
    return LevelPivot(
      id: json['id'],
      courseId: json['course_id'],
      levelId: json['level_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'level_id': levelId,
    };
  }
}