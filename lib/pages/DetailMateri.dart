import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pembelajaran/model/Materi.dart';
import 'package:pembelajaran/model/MateriDetail.dart';
import 'package:pembelajaran/network/BaseUrl.dart';

class DetailMateri extends StatefulWidget {
  final int? idMateri;
  DetailMateri(this.idMateri);

  @override
  _DetailMateriState createState() => _DetailMateriState();
}

class _DetailMateriState extends State<DetailMateri> {
  String? title = "";
  List<MateriDetailModel> listDetailMateri = [];

  getDetail() async {
    final dio = Dio();
    final response = await dio.get(BaseUrl.showMateri(widget.idMateri));
    if (response.statusCode == 200) {
      final dataMateri = response.data["data"]["materi"];
      final detailMateri = response.data["data"]["detail_materi"];

      MateriModel hasilMateri = MateriModel.fromMap(dataMateri);

      title = hasilMateri.title;

      for (Map i in detailMateri) {
        listDetailMateri
            .add(MateriDetailModel.fromJson(i as Map<String, dynamic>));
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
