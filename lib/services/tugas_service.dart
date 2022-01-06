import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:pembelajaran/constants/api.dart';
import 'package:pembelajaran/models/tugas.dart';
import 'package:pembelajaran/services/get/get_tugas.dart';
import 'get/get_picker.dart';

class TugasService {
  static Future<void> upload(int userId, int id) async {
    final pickerController = getx.Get.put(PickerController());
    final file = pickerController.pickedFile;
    if (file != null) {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(file.path, filename: fileName),
      });

      try {
        final dio = Dio();
        final response =
            await dio.post(BaseUrl.tugas + "/$id/$userId", data: formData);
        // if (response.data["data"] == 200) {
          // final tugas = response.data["data"];
          TugasService.getTugas(userId);
          getx.Get.back();
          getx.Get.snackbar(
            "Berhasil",
            'Berhasil kirim tugas',
            snackPosition: getx.SnackPosition.TOP,
            backgroundColor: Colors.green,
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 4),
            isDismissible: false,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        // }
      } catch (e) {}
    } else {
      getx.Get.snackbar(
        "Gagal",
        'Masukan gambar',
        snackPosition: getx.SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: false,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  static Future<void> getTugas(int id) async {
    final dio = Dio();
    final tugasController = getx.Get.put(TugasController());
    tugasController.updateTugas([]);
    tugasController.onLoadData();
    try {
      final response = await dio.get(BaseUrl.tugas + '/siswa/$id');
      if (response.statusCode == 200) {
        final List<Tugas> listTugas = [];
        final dataMateri = response.data["data"];

        for (Map i in dataMateri) {
          listTugas.add(Tugas.fromMap(i as Map<String, dynamic>));
        }
        tugasController.updateTugas(listTugas);
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