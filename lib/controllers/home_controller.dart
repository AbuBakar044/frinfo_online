import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frinfo_online/model/friend_model.dart';
import 'package:frinfo_online/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel userModel = UserModel();
  List<FriendModel> friendsList = [];

  @override
  void onInit() {
    getFriendsData();
    super.onInit();
  }

  Future<void> getFriendsData() async {
    DocumentSnapshot userData = await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    userModel = UserModel.fromDocumentsSnapshot(userData);
    friendsList = userModel.userFriends!
        .map((data) => FriendModel.fromJson(data))
        .toList();

    update();

    print('......................${userModel.userEmail}');

    print('.........................${friendsList[0].name}');
  }
}
