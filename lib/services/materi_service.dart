import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/model/materi.dart';
import 'package:pembelajaran/constants/api.dart';
import 'package:pembelajaran/services/get/get_materi.dart';

class MateriService {
  static final materiController = Get.put(MateriController());
  static getListMateri() async {
    final dio = Dio();
    final response = await dio.get(BaseUrl.materi);

    if (response.statusCode == 200) {
      final List<Materi> listMateri = [];
      final dataMateri = response.data['data'];
      for (Map i in dataMateri) {
        listMateri.add(Materi.fromMap(i as Map<String, dynamic>));
      }
      materiController.updateMateri(listMateri);
    }
  }
}
