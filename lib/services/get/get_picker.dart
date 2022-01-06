import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickerController extends GetxController {
  XFile? pickedFile;
  void updatePicked(XFile? data) {
    pickedFile = data;
    update();
  }
}
