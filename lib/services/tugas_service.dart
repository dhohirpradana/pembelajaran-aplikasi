import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pembelajaran/constants/api.dart';

class TugasService {
  Future<void> upload(int userId, int id, File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    try {
      final dio = Dio();
      final response =
          await dio.post(BaseUrl.tugas + "/$id/$userId", data: formData);
      if (response.statusCode == 200) {
        final tugas = response.data["data"];
        print(tugas);
      }
    } catch (e) {}
  }
}

    // var formData = FormData();
    // for (var file in filePath) {
    //   formData.files.addAll([
    //     MapEntry("image", await MultipartFile.fromFile(file.path)),
    //   ]);
    // }