import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frinfo_online/views/friends/home_screen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> loginWithFirebse() async {
    try {
      firebaseAuth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        emailController.clear();
        passwordController.clear();

        Get.snackbar('Frinfo', 'Loggedin successfully!',
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.offAll(() => HomeScreen());
      });
    } on FirebaseAuthException catch (e) {}
  }

  void validateFields() {
    if (loginFormKey.currentState!.validate()) {
      loginWithFirebse();
    }
  }
}
