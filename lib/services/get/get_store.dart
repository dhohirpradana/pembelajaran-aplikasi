import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pembelajaran/model/User.dart';
import 'get_auth.dart';

Future<User?> boxUser() async {
  final userController = Get.put(UserController());
  final box = GetStorage();
  final user = (box.read('user') != null) ? jsonDecode(box.read('user')) : null;

  late User? decodedUser;
  if (user != null) {
    decodedUser = User.fromMap(user);
    userController.updateUser(decodedUser);
  } else {
    decodedUser = null;
  }
  print(decodedUser);
  return decodedUser;
}
