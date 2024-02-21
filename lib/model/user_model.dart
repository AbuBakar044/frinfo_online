import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frinfo_online/model/friend_model.dart';

class UserModel {
  String? userEmail;
  String? userName;
  List<FriendModel>? userFriends;

  UserModel({this.userEmail, this.userFriends, this.userName});

  factory UserModel.fromDocumentsSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      
    );
  }
}
