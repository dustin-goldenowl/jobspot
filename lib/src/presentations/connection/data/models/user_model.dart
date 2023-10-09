import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return UserModel(
      id: snapshot.id,
      name: data["name"],
      avatar: data["avatar"],
    );
  }
}
