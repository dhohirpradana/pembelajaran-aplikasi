import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pembelajaran/model/Tugas.dart';
import 'package:pembelajaran/network/BaseUrl.dart';
import 'package:pembelajaran/pages/DetailTugas.dart';

class TugasPage extends StatefulWidget {
  @override
  _TugasPageState createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  List<TugasModel> listTugas = [];

  getListTugas() async {
    final dio = Dio();
    final response = await dio.get(BaseUrl.tugas);

    if (response.statusCode == 200) {
      final dataMateri = response.data["data"];

      for (Map i in dataMateri) {
        listTugas.add(TugasModel.createTugas(i as Map<String, dynamic>));
      }

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getListTugas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6930c3),
        title: Text("Daftar Tugas"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        shrinkWrap: false,
        itemCount: listTugas.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailTugas(
                      listTugas[index].name,
                    ),
                  ),
                );
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF6930c3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "${listTugas[index].name}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
