import 'dart:convert';

class MateriDetail {
  final int? id;
  final String? image;
  MateriDetail({
    this.id,
    this.image,
  });

  MateriDetail copyWith({
    int? id,
    String? image,
    int? idMateri,
  }) {
    return MateriDetail(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory MateriDetail.fromMap(Map<String, dynamic> map) {
    return MateriDetail(
      id: map['id']?.toInt(),
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MateriDetail.fromJson(String source) =>
      MateriDetail.fromMap(json.decode(source));

  @override
  String toString() => 'MateriDetail(id: $id, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MateriDetail && other.id == id && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode;
}
