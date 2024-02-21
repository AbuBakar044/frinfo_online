import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFriendController extends GetxController {
  Uint8List? friendImage;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  File? imageFile;
  String friendUrl = '';

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
      imageFile = File(tempImage.path);
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
      'f_image': friendUrl,
    };

    if (imageFile != null) {
      await saveImage().then((value) {
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
      });
    } else{
      await firebaseFirestore
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

  Future<void> saveImage() async {
    TaskSnapshot imageSnapshot = await firebaseStorage
        .ref('images')
        .child(DateTime.now().toString())
        .putFile(
          imageFile!,
          SettableMetadata(
            contentType: "jpg",
          ),
        );

    friendUrl = await imageSnapshot.ref.getDownloadURL();
    update();
  }
}
