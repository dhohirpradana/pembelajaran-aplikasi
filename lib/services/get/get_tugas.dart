import 'package:get/get.dart';
import 'package:pembelajaran/models/tugas.dart';

class TugasController extends GetxController {
  List<Tugas> tugas = [];
  bool isLoad = true;
  void updateTugas(List<Tugas> data) {
    tugas = data;
    isLoad = false;
    update();
  }

  void onLoadData() {
    isLoad = true;
    update();
  }
}
