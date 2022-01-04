// ignore_for_file: must_be_immutable
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/model/game.dart';
import 'package:pembelajaran/constants/api.dart';
import 'package:pembelajaran/pages/game_response_page.dart';
import 'package:pembelajaran/services/game_detail_service.dart';
import 'package:pembelajaran/services/get/get_game_detail.dart';

class GameDetailPage extends StatelessWidget {
  final Game gameDetail;
  GameDetailPage(this.gameDetail);

  final gameDetailController = Get.put(GameDetailController());

  // main color

// green    00917c
// blue     11698e
// orange   f58634
// red      ff005c
// purple   6930c3

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
  }

  @override
  Widget build(BuildContext context) {
    GameDetailService.getDetail(gameDetail.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFef8d32),
        title: Text("Detail Game"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Image.network(BaseUrl.image + gameDetail.gambar),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    gameDetail.name,
                    maxLines: 5,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Expanded(
                child: GetBuilder<GameDetailController>(builder: (context) {
              return ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: gameDetailController.gameDetail.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    final suffleColor = shuffle(warna);
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResponseGame(
                                      gameDetailController
                                          .gameDetail[index].benar)));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: Get.width - 20,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: suffleColor[index],
                          ),
                          child: Center(
                            child: Text(
                              gameDetailController.gameDetail[index].jawaban,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            })),
          ],
        ),
      ),
    );
  }
}
