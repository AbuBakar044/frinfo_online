import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frinfo_online/model/friend_model.dart';

class UserModel {
  String? userEmail;
  String? userName;
  List<dynamic>? userFriends;

  UserModel({this.userEmail, this.userFriends, this.userName});

  factory UserModel.fromDocumentsSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return UserModel(
      userEmail: snapshot.data().toString().contains('email')
          ? snapshot.get('email')
          : '',
      userName: snapshot.data().toString().contains('name')
          ? snapshot.get('name')
          : '',
      userFriends: snapshot.data().toString().contains('friends')
          ? snapshot.get('friends')
          : [],
    );
  }
}
