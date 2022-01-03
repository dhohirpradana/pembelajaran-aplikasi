import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pembelajaran/model/user.dart';
import 'package:pembelajaran/network/api.dart';
import 'package:get/get.dart' as getx;
import 'get/get_auth.dart';

class Auth {
  static final dio = Dio();
  static final userController = Get.put(UserController());

  static Future<void> login(String nik, String password) async {
    var params = {
      'nik': nik,
      'password': password,
    };
    try {
      final response = await dio.get(BaseUrl.login, queryParameters: params);
      if (response.data['success'] == true) {
        var usersData = response.data['data'];
        var userModel = User.fromMap(usersData);
        userController.updateUser(userModel);
      } else {
        getx.Get.snackbar(
          "Gagal",
          response.data['message'],
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
    } catch (e) {
      getx.Get.snackbar(
        "Error",
        "Koneksi internet buruk.",
        snackPosition: getx.SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: false,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
    Navigator.of(Get.overlayContext!).pop();
  }
}
