// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class User {
  final int id;
  final String name;
  final String nik;
  final String password;
  final String tanggal_lahir;
  final String jekel;
  final String nama_ortu;
  final String alamat;
  final String whatsapp;
  User({
    required this.id,
    required this.name,
    required this.nik,
    required this.password,
    required this.tanggal_lahir,
    required this.jekel,
    required this.nama_ortu,
    required this.alamat,
    required this.whatsapp,
  });

  User copyWith({
    int? id,
    String? name,
    String? nik,
    String? password,
    String? tanggal_lahir,
    String? jekel,
    String? nama_ortu,
    String? alamat,
    String? whatsapp,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      nik: nik ?? this.nik,
      password: password ?? this.password,
      tanggal_lahir: tanggal_lahir ?? this.tanggal_lahir,
      jekel: jekel ?? this.jekel,
      nama_ortu: nama_ortu ?? this.nama_ortu,
      alamat: alamat ?? this.alamat,
      whatsapp: whatsapp ?? this.whatsapp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nik': nik,
      'password': password,
      'tanggal_lahir': tanggal_lahir,
      'jekel': jekel,
      'nama_ortu': nama_ortu,
      'alamat': alamat,
      'whatsapp': whatsapp,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      nik: map['nik'] ?? '',
      password: map['password'] ?? '',
      tanggal_lahir: map['tanggal_lahir'] ?? '',
      jekel: map['jekel'] ?? '',
      nama_ortu: map['nama_ortu'] ?? '',
      alamat: map['alamat'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, nik: $nik, password: $password, tanggal_lahir: $tanggal_lahir, jekel: $jekel, nama_ortu: $nama_ortu, alamat: $alamat, whatsapp: $whatsapp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.nik == nik &&
        other.password == password &&
        other.tanggal_lahir == tanggal_lahir &&
        other.jekel == jekel &&
        other.nama_ortu == nama_ortu &&
        other.alamat == alamat &&
        other.whatsapp == whatsapp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        nik.hashCode ^
        password.hashCode ^
        tanggal_lahir.hashCode ^
        jekel.hashCode ^
        nama_ortu.hashCode ^
        alamat.hashCode ^
        whatsapp.hashCode;
  }
}
