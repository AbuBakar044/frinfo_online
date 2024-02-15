import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFriendController extends GetxController {
  Uint8List? friendImage;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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

  Future<void> saveFriend() async {
    Map<String, dynamic> friendData = {
      'f_name': nameController.text,
      'f_number': numberController.text,
      'f_desc': descController.text,
    };

    firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .update({
      'friends': FieldValue.arrayUnion([friendData])
    }).then((value) {
      nameController.clear();
      numberController.clear();
      descController.clear();

      Get.snackbar('Frinfo', 'Friend saved successfully!');
    });
  }
}
