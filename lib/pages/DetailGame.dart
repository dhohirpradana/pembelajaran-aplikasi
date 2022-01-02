import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pembelajaran/model/GameJawabanModel.dart';
import 'package:pembelajaran/model/GameSoalModel.dart';
import 'package:pembelajaran/network/BaseUrl.dart';
import 'package:pembelajaran/pages/ResponseGame.dart';

class DetailGame extends StatefulWidget {
  final int? idGame;
  DetailGame(this.idGame);

  @override
  _DetailGameState createState() => _DetailGameState();
}

class _DetailGameState extends State<DetailGame> {
  String? title = "";
  String image = "";
  List<GameJawabanModel> listDetailGame = [];

  getDetail() async {
    final dio = Dio();
    final response = await dio.get(BaseUrl.showGame(widget.idGame));

    if (response.statusCode == 200) {
      final data = response.data["data"]["soal"];
      final detail = response.data["data"]["game_jawaban"];
      GameSoalModel hasil = GameSoalModel.createGameSoal(data);

      title = hasil.name;
      image = BaseUrl.image + hasil.gambar!;

      for (Map i in detail) {
        listDetailGame
            .add(GameJawabanModel.fromJson(i as Map<String, dynamic>));
      }

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFef8d32),
        title: Text("Detail Game"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: listDetailGame.length,
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResponseGame(
                                      listDetailGame[index].benar)));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF250b7a),
                          ),
                          child: Center(
                            child: Text(
                              listDetailGame[index].jawaban!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
