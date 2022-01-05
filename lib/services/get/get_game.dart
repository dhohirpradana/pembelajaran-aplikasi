import 'package:get/get.dart';
import 'package:pembelajaran/models/game.dart';

class GameController extends GetxController {
  List<Game> game = [];
  bool isLoad = true;
  void updateGameSoal(List<Game> data) {
    game = data;
    isLoad = false;
    update();
  }

  void onLoadData() {
    isLoad = true;
    update();
  }
}
