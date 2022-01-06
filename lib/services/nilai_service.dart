import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:pembelajaran/constants/api.dart';
import 'package:pembelajaran/models/nilai.dart';
import 'get/get_nilai.dart';

class NilaiService {
  static Future<void> getNilai(int id) async {
    final nilaiController = getx.Get.put(NilaiController());
    nilaiController.updateNilai([]);
    nilaiController.onLoadData();
    try {
      final dio = Dio();
      final response = await dio.get(BaseUrl.tugas + '/nilai/$id');
      if (response.statusCode == 200) {
        final List<Nilai> listNilai = [];
        final dataMateri = response.data["data"];

        for (Map i in dataMateri) {
          listNilai.add(Nilai.fromMap(i as Map<String, dynamic>));
        }
        nilaiController.updateNilai(listNilai);
      }
    } catch (e) {}
  }
}
