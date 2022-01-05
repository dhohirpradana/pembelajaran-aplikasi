import 'package:dio/dio.dart';
import 'package:pembelajaran/constants/get_controller.dart';
import 'package:pembelajaran/models/materi.dart';
import 'package:pembelajaran/constants/api.dart';

class MateriService {
  static getListMateri() async {
    materiController.updateMateri([]);
    materiController.onLoadData();
    final dio = Dio();
    try {
      final response = await dio.get(BaseUrl.materi);
      if (response.statusCode == 200) {
        final List<Materi> listMateri = [];
        final dataMateri = response.data['data'];
        for (Map i in dataMateri) {
          listMateri.add(Materi.fromMap(i as Map<String, dynamic>));
        }
        materiController.updateMateri(listMateri);
      }
    } catch (e) {
      print(e);
    }
  }
}
