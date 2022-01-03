import 'package:get/get.dart';
import 'package:pembelajaran/model/materi.dart';

class MateriController extends GetxController {
  List<Materi> materi = [];
  void updateMateri(List<Materi> data) {
    materi = data;
    update();
  }
}
