import 'package:get/get.dart';
import 'package:pembelajaran/model/materi_detail.dart';

class MateriDetailController extends GetxController {
  List<MateriDetail> materiDetail = [];
  void updateMateriDetail(List<MateriDetail> data) {
    materiDetail = data;
    update();
  }
}
