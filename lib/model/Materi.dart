import 'dart:convert';

class MateriModel {
  final int? id;
  final String? title;
  MateriModel({
    this.id,
    this.title,
  });

  MateriModel copyWith({
    int? id,
    String? title,
  }) {
    return MateriModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory MateriModel.fromMap(Map<String, dynamic> map) {
    return MateriModel(
      id: map['id']?.toInt(),
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MateriModel.fromJson(String source) =>
      MateriModel.fromMap(json.decode(source));

  @override
  String toString() => 'MateriModel(id: $id, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MateriModel && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
