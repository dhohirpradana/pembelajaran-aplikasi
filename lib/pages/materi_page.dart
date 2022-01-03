// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/pages/materi_detail_page.dart';
import 'package:pembelajaran/services/get/get_materi.dart';

class MateriPage extends StatelessWidget {
  final materiController = Get.put(MateriController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00917c),
        title: Text("Daftar Materi"),
      ),
      body: GetBuilder<MateriController>(
        builder: (_) => ListView.builder(
          padding: EdgeInsets.all(10),
          shrinkWrap: false,
          itemCount: materiController.materi.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailMateri(materiController.materi[index].id)));
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF00917c),
                  ),
                  child: Center(
                    child: Text(
                      "${materiController.materi[index].title}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
