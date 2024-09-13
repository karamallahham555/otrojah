class Standard {
  final int id;
  final String name;
  final int scoreDeduct;

  Standard({
    required this.id,
    required this.name,
    required this.scoreDeduct,
  });

  factory Standard.fromJson(Map<String, dynamic> json) {
    return Standard(
      id: json['id'],
      name: json['name'],
      scoreDeduct: json['score_deduct'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score_deduct': scoreDeduct,
    };
  }
}