import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'get/get_picker.dart';

imgFromGallery() async {
  final pickerController = Get.put(PickerController());
  final ImagePicker imagePicker = ImagePicker();
  final image = await imagePicker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    pickerController.updatePicked(image);
  } else {
    pickerController.updatePicked(null);
  }
}
