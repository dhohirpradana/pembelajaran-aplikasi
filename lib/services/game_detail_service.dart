import 'package:dio/dio.dart';
import 'package:pembelajaran/constants/get_controller.dart';
import 'package:pembelajaran/model/game_detail.dart';
import 'package:pembelajaran/constants/api.dart';

class GameDetailService {
  static getDetail(int id) async {
    gameDetailController.updateDetail([]);
    final dio = Dio();
    final response = await dio.get(BaseUrl.showGame(id));
    List<GameDetail> listDetailGame = [];

    if (response.statusCode == 200) {
      final detail = response.data["data"]["game_jawaban"];
      for (Map i in detail) {
        listDetailGame.add(GameDetail.fromMap(i as Map<String, dynamic>));
      }
      gameDetailController.updateDetail(listDetailGame);
    }
  }
}
