import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pembelajaran/model/user.dart';

class UserController extends GetxController {
  final box = GetStorage();
  User? user;
  void updateUser(User? data) {
    user = data;
    update();
    box.write('user', user);
  }
}
