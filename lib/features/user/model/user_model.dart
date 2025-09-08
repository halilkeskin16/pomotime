import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final int totalCoins;
  final Timestamp createdAt;

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    required this.totalCoins,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      displayName: map['displayName'],
      email: map['email'],
      totalCoins: map['totalCoins'],
      createdAt: map['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'totalCoins': totalCoins,
      'createdAt': createdAt,
    };
  }

}
