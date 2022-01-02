import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pembelajaran/pages/GamePage.dart';
import 'package:pembelajaran/pages/HomePage.dart';
import 'package:pembelajaran/pages/MateriPage.dart';
import 'package:pembelajaran/pages/TugasPage.dart';
import 'package:pembelajaran/pages/loginPage.dart';
import 'services/get/get_auth.dart';
import 'services/get/get_store.dart';

Future<void> main() async {
  await GetStorage.init();
  await boxUser();
  final userController = Get.put(UserController());
  runApp(GetMaterialApp(
    home: GetBuilder<UserController>(
        builder: (_) =>
            (userController.user == null) ? LoginPage() : HomePage()),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new HomePage(),
      '/materi': (BuildContext context) => new MateriPage(),
      '/game': (BuildContext context) => new GamePage(),
      '/tugas': (BuildContext context) => new TugasPage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


// main color 

// green    00917c
// blue     11698e
// orange   f58634
// red      ff005c
// purple   6930c3