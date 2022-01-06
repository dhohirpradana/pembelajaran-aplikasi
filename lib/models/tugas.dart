import 'dart:convert';

class Tugas {
  final int? id;
  final String? name;
  Tugas({
    this.id,
    this.name,
  });

  Tugas copyWith({
    int? id,
    String? name,
  }) {
    return Tugas(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Tugas.fromMap(Map<String, dynamic> map) {
    return Tugas(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tugas.fromJson(String source) => Tugas.fromMap(json.decode(source));

  @override
  String toString() => 'Tugas(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tugas && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
