import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pembelajaran/network/BaseUrl.dart';

class MateriDetailModel {
  final int? id;
  final String? image;
  final int? idMateri;

  MateriDetailModel({this.id, this.image, this.idMateri});

  factory MateriDetailModel.fromJson(Map<String, dynamic> json) {
    return MateriDetailModel(
      id: json["id"],
      image: json["image"],
      idMateri: json["materi_id"],
    );
  }

  static Future<List<MateriDetailModel>> getMateriDetailFromApi(
      int idMateri) async {
    final dio = Dio();
    String apiUrl = BaseUrl.showMateri(idMateri);

    var apiResult = await dio.get(apiUrl);

    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.data);
      return (jsonObject["data"] as List)
          .map((e) => MateriDetailModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load kecamatan');
    }
  }
}
