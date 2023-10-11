import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyModel {
  String name;
  String avatar;
  String address;
  String id;

  CompanyModel({
    required this.id,
    required this.address,
    required this.avatar,
    required this.name,
  });

  factory CompanyModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return CompanyModel(
      id: snapshot.id,
      address: data["address"],
      avatar: data["avatar"],
      name: data["name"],
    );
  }
}
