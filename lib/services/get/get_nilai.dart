import 'package:get/get.dart';
import 'package:pembelajaran/models/nilai.dart';

class NilaiController extends GetxController {
  List<Nilai> nilai = [];
  bool isLoad = true;
  void updateNilai(List<Nilai> data) {
    nilai = data;
    isLoad = false;
    update();
  }

  void onLoadData() {
    isLoad = true;
    update();
  }
}
