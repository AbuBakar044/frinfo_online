import 'package:flutter/foundation.dart';



class FriendModel {
  
  Uint8List? image;


  String? name;

  String? number;

  String? desc;

  //Constructor
  FriendModel({
    this.image,
    this.name,
    this.number,
    this.desc,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json){
    return FriendModel(
      //image: json['f_image'],
      name: json['f_name'],
      number: json['f_number'],
      desc: json['f_desc']
    );
  }
}
