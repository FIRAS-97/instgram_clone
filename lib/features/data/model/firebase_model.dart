import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseModel {
  final String? uid2;
  final String? userName;
  final String? userEmail;
  final String? phoneNumber;
  final List? following;
  final List? followers;
  final String? image;

  FirebaseModel(
      {this.uid2,
      this.userName,
      this.userEmail,
      this.phoneNumber,
      this.following,
      this.followers,
      this.image});
  Map<String, dynamic> tojson() => {
        "userName": userName,
        "userEmail": userEmail,
        "PhoneNumber": phoneNumber,
        "following": following,
        "followers": followers,
        "file": image,
        "uid": uid2
      };
  static FirebaseModel fromSnap(DocumentSnapshot snapshot) {
    var snapshot1 = snapshot.data() as Map<String, dynamic>;
    return FirebaseModel(
      userName : snapshot1["userName"],
      userEmail: snapshot1["userEmail"],
      phoneNumber:snapshot1["PhoneNumber"],
      following: snapshot1["following"],
      followers:snapshot1["followers"],
      image:snapshot1["file"],

    );
  }
}
