import 'dart:convert';

class Game {
  final int id;
  final String name;
  final String gambar;
  Game({
    required this.id,
    required this.name,
    required this.gambar,
  });

  Game copyWith({
    int? id,
    String? name,
    String? gambar,
  }) {
    return Game(
      id: id ?? this.id,
      name: name ?? this.name,
      gambar: gambar ?? this.gambar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gambar': gambar,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      gambar: map['gambar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) => Game.fromMap(json.decode(source));

  @override
  String toString() => 'Game(id: $id, name: $name, gambar: $gambar)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Game &&
        other.id == id &&
        other.name == name &&
        other.gambar == gambar;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ gambar.hashCode;
}
