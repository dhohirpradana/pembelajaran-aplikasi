import 'dart:convert';

class Materi {
  final int? id;
  final String? title;
  final String? konten;
  Materi({
    this.id,
    this.title,
    this.konten,
  });

  Materi copyWith({
    int? id,
    String? title,
    String? konten,
  }) {
    return Materi(
      id: id ?? this.id,
      title: title ?? this.title,
      konten: konten ?? this.konten,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'konten': konten,
    };
  }

  factory Materi.fromMap(Map<String, dynamic> map) {
    return Materi(
      id: map['id']?.toInt(),
      title: map['title'],
      konten: map['konten'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Materi.fromJson(String source) => Materi.fromMap(json.decode(source));

  @override
  String toString() => 'Materi(id: $id, title: $title, konten: $konten)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Materi &&
        other.id == id &&
        other.title == title &&
        other.konten == konten;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ konten.hashCode;
}
