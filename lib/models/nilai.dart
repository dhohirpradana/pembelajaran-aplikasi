import 'dart:convert';

class Nilai {
  final String? name;
  final int? nilai;
  Nilai({
    this.name,
    this.nilai,
  });

  Nilai copyWith({
    String? name,
    int? nilai,
  }) {
    return Nilai(
      name: name ?? this.name,
      nilai: nilai ?? this.nilai,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nilai': nilai,
    };
  }

  factory Nilai.fromMap(Map<String, dynamic> map) {
    return Nilai(
      name: map['name'],
      nilai: map['nilai']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Nilai.fromJson(String source) => Nilai.fromMap(json.decode(source));

  @override
  String toString() => 'Nilai(name: $name, nilai: $nilai)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Nilai && other.name == name && other.nilai == nilai;
  }

  @override
  int get hashCode => name.hashCode ^ nilai.hashCode;
}
