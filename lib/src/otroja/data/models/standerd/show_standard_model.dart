class ShowStandardsModel {
  int? id;
  String? name;
  int? scoreDeduct;
  String? createdAt;
  String? updatedAt;

  ShowStandardsModel(
      {this.id, this.name, this.scoreDeduct, this.createdAt, this.updatedAt});

  ShowStandardsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    scoreDeduct = json['score_deduct'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score_deduct'] = this.scoreDeduct;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}