import 'package:get/get.dart';
import 'package:pembelajaran/model/materi.dart';

class MateriController extends GetxController {
  List<Materi> materi = [];
  bool isLoad = true;
  void updateMateri(List<Materi> data) {
    materi = data;
    isLoad = false;
    update();
  }

  void onLoadData() {
    isLoad = true;
    update();
  }
}
