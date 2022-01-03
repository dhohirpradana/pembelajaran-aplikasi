// ignore_for_file: must_be_immutable
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pembelajaran/model/materi.dart';
import 'package:pembelajaran/model/materi_detail.dart';
import 'package:pembelajaran/network/api.dart';

class DetailMateri extends StatelessWidget {
  final int? idMateri;
  DetailMateri(this.idMateri);
  String? title = "";
  List<MateriDetailModel> listDetailMateri = [];

  getDetail() async {
    final dio = Dio();
    final response = await dio.get(BaseUrl.showMateri(idMateri));
    if (response.statusCode == 200) {
      final dataMateri = response.data["data"]["materi"];
      final detailMateri = response.data["data"]["detail_materi"];

      Materi hasilMateri = Materi.fromMap(dataMateri);

      title = hasilMateri.title;

      for (Map i in detailMateri) {
        listDetailMateri
            .add(MateriDetailModel.fromJson(i as Map<String, dynamic>));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00917c),
        title: Text("Detail materi "),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF00917c),
              ),
              child: Center(
                child: Text(
                  "${title.toString()}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: false,
              itemCount: listDetailMateri.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                              BaseUrl.image + listDetailMateri[index].image!,
                            ),
                            fit: BoxFit.cover)),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
