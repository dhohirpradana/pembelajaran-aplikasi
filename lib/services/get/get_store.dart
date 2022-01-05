import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:pembelajaran/constants/get_controller.dart';
import 'package:pembelajaran/models/user.dart';

Future<User?> boxUser() async {
  final box = GetStorage();
  final user = (box.read('user') != null) ? jsonDecode(box.read('user')) : null;

  late User? decodedUser;
  if (user != null) {
    decodedUser = User.fromMap(user);
    userController.updateUser(decodedUser);
  } else {
    decodedUser = null;
  }
  return decodedUser;
}
