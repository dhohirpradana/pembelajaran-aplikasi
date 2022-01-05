// ignore_for_file: must_be_immutable
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/constants/get_controller.dart';
import 'package:pembelajaran/models/game.dart';
import 'package:pembelajaran/constants/api.dart';
import 'package:pembelajaran/services/game_service.dart';
import 'package:pembelajaran/services/get/get_game.dart';
import 'package:pembelajaran/widgets/shimmer_widget.dart';
import 'game_detail_page.dart';

class GamePage extends StatelessWidget {
  final List<Game> listGame = [];
  getListGame() async {
    final dio = Dio();
    final response = await dio.get(BaseUrl.game);

    if (response.statusCode == 200) {
      final dataMateri = response.data["data"];

      for (Map i in dataMateri) {
        listGame.add(Game.fromMap(i as Map<String, dynamic>));
      }
    }
  }

  List<Color> warna = [
    Color(0xFF00917c),
    Color(0xFF11698e),
    Color(0xFFff005c),
    Color(0xFFf58634),
    Color(0xFF6930c3),
  ];

  List shuffle(List items) {
    var random = Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
    // final suffleColor = shuffle(warna);
  }

  @override
  Widget build(BuildContext context) {
    GameService.getGame();
    return
        // Text(listGame[0].name.toString())
        GetBuilder<GameController>(
      builder: (_) => (gameController.isLoad)
          ? ShimmerWidget()
          : ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: false,
              itemCount: gameController.game.length,
              itemBuilder: (BuildContext context, int index) {
                final suffleColor = shuffle(warna);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GameDetailPage(gameController.game[index]),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: Get.width - 30,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: suffleColor[0],
                      ),
                      child: Center(
                        child: Text(
                          "${gameController.game[index].name}".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
