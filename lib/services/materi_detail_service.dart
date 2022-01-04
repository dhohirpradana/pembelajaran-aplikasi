import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/model/materi_detail.dart';
import 'package:pembelajaran/constants/api.dart';
import 'package:pembelajaran/services/get/get_materi_detail.dart';

class MateriDetailService {
  static Future<void> getMateriDetail(int idMateri) async {
    final materiDetailController = Get.put(MateriDetailController());
    materiDetailController.updateMateriDetail([]);
    final dio = Dio();
    final response = await dio.get(BaseUrl.showMateri(idMateri));

    if (response.statusCode == 200) {
      final List<MateriDetail> materiDetail = [];
      final detailMateri = response.data["data"]["detail_materi"];
      // MateriDetail hasilMateri = MateriDetail.fromMap(detailMateri);
      for (Map i in detailMateri) {
        materiDetail.add(MateriDetail.fromMap(i as Map<String, dynamic>));
      }
      materiDetailController.updateMateriDetail(materiDetail);
    }
  }
}
