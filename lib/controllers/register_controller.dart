import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/views/friends/home_screen.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final regiserFormKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> registerWithFirebase() async {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailCtrl.text, password: passCtrl.text)
          .then((value) {
        Map<String, dynamic> data = {
          'name': nameCtrl.text,
          'email': emailCtrl.text,
          'password': passCtrl.text,
        };
        firebaseFirestore
            .collection('users')
            .doc(value.user!.uid)
            .set(data)
            .then((value) {
          nameCtrl.clear();
          emailCtrl.clear();
          passCtrl.clear();

          Get.off(() => HomeScreen());
           Get.snackbar('Frinfo', 'Registered Successfuly!');
        });
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Frinfo', 'An error occured');
    }
  }

  void validateFields() {
    if (regiserFormKey.currentState!.validate()) {
      registerWithFirebase();
    }
  }
}
