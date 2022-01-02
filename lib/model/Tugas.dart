class TugasModel {
  final int? id;
  final String? name;
  final int? active;

  TugasModel({this.id, this.name, this.active});

  factory TugasModel.createTugas(Map<String, dynamic> json) {
    return TugasModel(
        id: json["id"], name: json["name"], active: json["active"]);
  }
}
