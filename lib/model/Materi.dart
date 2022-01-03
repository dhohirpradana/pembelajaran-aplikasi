import 'dart:convert';

class Materi {
  final int? id;
  final String? title;
  Materi({
    this.id,
    this.title,
  });

  Materi copyWith({
    int? id,
    String? title,
  }) {
    return Materi(
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

  factory Materi.fromMap(Map<String, dynamic> map) {
    return Materi(
      id: map['id']?.toInt(),
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Materi.fromJson(String source) => Materi.fromMap(json.decode(source));

  @override
  String toString() => 'Materi(id: $id, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Materi && other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
