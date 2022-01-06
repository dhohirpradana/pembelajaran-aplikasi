import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/foundation_page.dart';
import 'pages/login_page.dart';
import 'services/get/get_auth.dart';
import 'services/get/get_store.dart';

Future<void> main() async {
  await GetStorage.init();
  await boxUser();
  final userController = Get.put(UserController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<UserController>(
        builder: (_) => (userController.user == null)
            ? LoginPage()
            : FoundationPage(
                user: userController.user!,
              ),
      ),
    ),
  );
}
