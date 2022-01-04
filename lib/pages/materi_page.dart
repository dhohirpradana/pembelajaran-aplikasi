// ignore_for_file: must_be_immutable
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/pages/materi_detail_page.dart';
import 'package:pembelajaran/services/get/get_materi.dart';
import 'package:pembelajaran/services/get/get_materi_detail.dart';
import 'package:pembelajaran/services/materi_service.dart';

class MateriPage extends StatelessWidget {
  final materiController = Get.put(MateriController());
  final materiDetailController = Get.put(MateriDetailController());

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
    final suffleColor = shuffle(warna);
    MateriService.getListMateri();
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
                            DetailMateriPage(materiController.materi[index])));
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: Get.width - 30,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: suffleColor[index],
                  ),
                  child: Center(
                    child: Text(
                      "${materiController.materi[index].title}".toUpperCase(),
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
      ),
    );
  }
}
