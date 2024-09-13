class AddActivityModel {
  final String name;
  final String description;
  final int points;
  final String? type;
  final String? every;

  AddActivityModel({
    required this.name,
    required this.description,
    required this.points,
   this.type,
   this.every,
  });

  factory AddActivityModel.fromJson(Map<String, dynamic> json) {
    return AddActivityModel(
      name: json['name'] as String,
      description: json['description'] as String,
      points: json['points'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'points': points,
      'every': every,
      'type': type,
    };
  }
}
