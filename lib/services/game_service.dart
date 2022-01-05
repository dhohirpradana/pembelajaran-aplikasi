import 'package:dio/dio.dart';
import 'package:pembelajaran/constants/get_controller.dart';
import 'package:pembelajaran/models/game.dart';
import 'package:pembelajaran/constants/api.dart';

class GameService {
  static Future<void> getGame() async {
    gameController.updateGameSoal([]);
    gameController.onLoadData();
    try {
      final dio = Dio();
      final response = await dio.get(BaseUrl.game);
      if (response.statusCode == 200) {
        final List<Game> gameDetail = [];
        final game = response.data["data"];

        for (Map i in game) {
          gameDetail.add(Game.fromMap(i as Map<String, dynamic>));
        }
        gameController.updateGameSoal(gameDetail);
      }
    } catch (e) {}
  }
}
