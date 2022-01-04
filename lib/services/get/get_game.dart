import 'package:get/get.dart';
import 'package:pembelajaran/model/game.dart';

class GameController extends GetxController {
  List<Game> game = [];
  void updateGameSoal(List<Game> data) {
    game = data;
    update();
  }
}
