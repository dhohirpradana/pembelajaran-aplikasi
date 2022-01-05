import 'package:get/get.dart';
import 'package:pembelajaran/models/game_detail.dart';

class GameDetailController extends GetxController {
  List<GameDetail> gameDetail = [];
  void updateDetail(List<GameDetail> data) {
    gameDetail = data;
    update();
  }
}
