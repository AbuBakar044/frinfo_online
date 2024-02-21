import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    getFriendsData();
    super.onInit();
  }

  Future<void> getFriendsData() async {
    //firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).

  }
}
