import 'package:get/get.dart';
import 'package:pembelajaran/models/materi_detail.dart';

class MateriDetailController extends GetxController {
  List<MateriDetail> materiDetail = [];
  void updateMateriDetail(List<MateriDetail> data) {
    materiDetail = data;
    update();
  }
}
