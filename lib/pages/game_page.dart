// ignore_for_file: must_be_immutable
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pembelajaran/model/game_soal.dart';
import 'package:pembelajaran/network/api.dart';
import 'package:pembelajaran/pages/game_detail_page.dart';

class GamePage extends StatelessWidget {
  List<GameSoalModel> listGame = [];

  getListGame() async {
    final dio = Dio();
    final response = await dio.get(BaseUrl.game);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final dataMateri = response.data["data"];

      for (Map i in dataMateri) {
        listGame.add(GameSoalModel.createGameSoal(i as Map<String, dynamic>));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFef8d32),
        title: Text("Daftar Game"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        shrinkWrap: false,
        itemCount: listGame.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetailPage(listGame[index].id),
                ),
              );
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xFFef8d44),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "${listGame[index].name}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
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
