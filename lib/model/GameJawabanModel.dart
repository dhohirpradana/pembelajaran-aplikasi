import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pembelajaran/network/BaseUrl.dart';

class GameJawabanModel {
  final int? id;
  final String? jawaban;
  final int? benar;
  final int? gameSoalId;

  GameJawabanModel({this.id, this.jawaban, this.benar, this.gameSoalId});

  factory GameJawabanModel.fromJson(Map<String, dynamic> json) {
    return GameJawabanModel(
      id: json["id"],
      jawaban: json["jawaban"],
      benar: json["benar"],
      gameSoalId: json["game_soal_id"],
    );
  }

  static Future<List<GameJawabanModel>> getGameJawabanFromApi(
      int idGameSoal) async {
    final dio = Dio();
    String apiUrl = BaseUrl.showGame(idGameSoal);

    var apiResult = await dio.get(apiUrl);

    if (apiResult.statusCode == 200) {
      var jsonObject = json.decode(apiResult.data);
      return (jsonObject["data"] as List)
          .map((e) => GameJawabanModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load kecamatan');
    }
  }
}
