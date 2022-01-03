import 'package:dio/dio.dart';
import 'package:pembelajaran/model/materi_detail.dart';
import 'package:pembelajaran/network/api.dart';
import 'package:pembelajaran/services/get/get_materi_detail.dart';

class MateriDetailService {
  static Future<void> getMateriDetail(int idMateri) async {
    final materiDetailController = MateriDetailController();
    final dio = Dio();
    final response = await dio.get(BaseUrl.showMateri(idMateri));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final detailMateri = response.data["data"]["detail_materi"][0];
      MateriDetail hasilMateri = MateriDetail.fromMap(detailMateri);
      materiDetailController.updateMateriDetail(hasilMateri);
    }
  }
}
