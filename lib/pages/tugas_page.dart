// ignore_for_file: must_be_immutable
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/models/user.dart';
import 'package:pembelajaran/pages/nilai_page.dart';
import 'package:pembelajaran/pages/tugas_detail_page.dart';
import 'package:pembelajaran/services/get/get_tugas.dart';
import 'package:pembelajaran/services/tugas_service.dart';
import 'package:pembelajaran/widgets/shimmer_widget.dart';

class TugasPage extends StatelessWidget {
  final User user;
  TugasPage({Key? key, required this.user}) : super(key: key);

  final tugasController = Get.put(TugasController());

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
    TugasService.getTugas(user.id);
    return Stack(
      children: [
        GetBuilder<TugasController>(
          builder: (_) => (tugasController.isLoad)
              ? ShimmerWidget()
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: false,
                  itemCount: tugasController.tugas.length,
                  itemBuilder: (BuildContext context, int index) {
                    final suffleColor = shuffle(warna);
                    return GestureDetector(
                      onTap: () => Get.to(() =>
                          DetailTugas(tugasController.tugas[index], user)),
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  (index == tugasController.tugas.length - 1)
                                      ? 80
                                      : 10),
                          padding: EdgeInsets.all(10),
                          width: Get.width - 20,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: suffleColor[0],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "${tugasController.tugas[index].name}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
        Positioned(
          bottom: 20,
          child: Container(
            margin: EdgeInsets.only(
              top: Get.height / 3,
              left: 20,
              right: 20,
            ),
            height: 50,
            child: GestureDetector(
              onTap: () {
                Get.to(() => NilaiPage(
                      user: user,
                    ));
              },
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF6930c3),
                  ),
                  width: Get.width - 40,
                  child: Center(
                      child: Text(
                    "LIHAT NILAI",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
