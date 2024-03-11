import 'package:flutter/foundation.dart';

class FriendModel {
  String? image;

  String? name;

  String? number;

  String? desc;
  String? imageName;

  //Constructor
  FriendModel({
    this.image,
    this.name,
    this.number,
    this.desc,
    this.imageName,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
        image: json['f_image'],
        name: json['f_name'],
        number: json['f_number'],
        desc: json['f_desc'],
        imageName: json['f_image_name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['f_image'] = image;
    data['f_name'] = name;
    data['f_number'] = number;
    data['f_desc'] = desc;
    data['f_image_name'] = imageName;
    return data;
  }
}
