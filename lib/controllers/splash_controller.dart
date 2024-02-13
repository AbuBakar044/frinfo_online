import 'package:firebase_auth/firebase_auth.dart';
import 'package:frinfo_online/views/auth/login.dart';
import 'package:frinfo_online/views/friends/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5), () {
      checkUserLoginStatus();
    });
    
    super.onInit();
  }

  Future<void> checkUserLoginStatus() async {
    if (firebaseAuth.currentUser != null) {
      Get.off(() => HomeScreen());
    } else {
      Get.off(() => LoginScreen());
    }
  }
}
