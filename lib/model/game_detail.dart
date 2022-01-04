import 'dart:convert';

class GameDetail {
  final int id;
  final String jawaban;
  final int benar;
  final int gameSoalId;
  GameDetail({
    required this.id,
    required this.jawaban,
    required this.benar,
    required this.gameSoalId,
  });

  GameDetail copyWith({
    int? id,
    String? jawaban,
    int? benar,
    int? gameSoalId,
  }) {
    return GameDetail(
      id: id ?? this.id,
      jawaban: jawaban ?? this.jawaban,
      benar: benar ?? this.benar,
      gameSoalId: gameSoalId ?? this.gameSoalId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'jawaban': jawaban,
      'benar': benar,
      'gameSoalId': gameSoalId,
    };
  }

  factory GameDetail.fromMap(Map<String, dynamic> map) {
    return GameDetail(
      id: map['id']?.toInt() ?? 0,
      jawaban: map['jawaban'] ?? '',
      benar: map['benar']?.toInt() ?? 0,
      gameSoalId: map['gameSoalId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameDetail.fromJson(String source) =>
      GameDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GameDetail(id: $id, jawaban: $jawaban, benar: $benar, gameSoalId: $gameSoalId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameDetail &&
        other.id == id &&
        other.jawaban == jawaban &&
        other.benar == benar &&
        other.gameSoalId == gameSoalId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        jawaban.hashCode ^
        benar.hashCode ^
        gameSoalId.hashCode;
  }
}
