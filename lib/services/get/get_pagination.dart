import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationController extends GetxController {
  int pageIndex = 0;
  String title = "Selamat Datang";
  Color warna = Colors.blue;
  void updatePageIndex(int index) {
    pageIndex = index;
    if (index == 0) {
      warna = Colors.blue;
      title = "Selamat datang";
    } else if (index == 1) {
      warna = Color(0xFF00917c);
      title = "MATERI";
    } else if (index == 2) {
      warna = Color(0xFFf58634);
      title = "GAME";
    } else {
      warna = Color(0xFF6930c3);
      title = "TUGAS";
    }

    update();
  }
}
