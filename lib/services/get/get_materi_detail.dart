import 'package:get/get.dart';
import 'package:pembelajaran/model/materi_detail.dart';

class MateriDetailController extends GetxController {
  MateriDetail? materiDetail;
  void updateMateriDetail(MateriDetail data) {
    materiDetail = data;
    update();
  }
}
