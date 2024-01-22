import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AccountController extends GetxController {
  Rx<File?> image = Rx<File?>(null);

  Future<void> getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }

  Future<void> getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }
}
