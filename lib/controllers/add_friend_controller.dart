import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFriendController extends GetxController {
  Uint8List? friendImage;
  final formKey = GlobalKey<FormState>();

  //Generated controllers to control texts in textformfields
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final descController = TextEditingController();

  Future<void> pickImage(ImageSource imageSource) async {
    XFile? tempImage = await ImagePicker().pickImage(source: imageSource);
    if (tempImage == null) {
      return;
    } else {
      friendImage = await tempImage.readAsBytes();
      update();
    }
  }

  void validateFields() {
    if (formKey.currentState!.validate()) {
      saveFriend();
    }
  }

  void saveFriend() {}
}
