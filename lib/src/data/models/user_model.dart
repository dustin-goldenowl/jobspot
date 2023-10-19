import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';

class UserModel {
  //general
  String name;
  String role;
  String avatar;
  String email;
  DateTime birthday;
  String address;
  String description;
  List<dynamic> follower;
  List<dynamic> following;
  DateTime updateAt;
  DateTime createAt;

  //applicant
  bool? gender;
  List<String>? skill;
  List<String>? saveJob;

  //business
  bool? isAccept;
  String? website;
  String? industry;
  String? employeeSize;
  List<String>? images;
  List<String>? specialization;

  UserModel({
    required this.name,
    required this.email,
    required this.avatar,
    required this.address,
    required this.birthday,
    required this.description,
    required this.follower,
    required this.following,
    required this.updateAt,
    required this.createAt,
    required this.role,
    this.gender,
    this.skill,
    this.saveJob,
    this.employeeSize,
    this.images,
    this.industry,
    this.isAccept,
    this.specialization,
    this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        birthday: DateTime.parse(json["birthday"]),
        address: json["address"],
        role: json["role"],
        follower: List<String>.from(json["follower"].map((x) => x)),
        gender: json["gender"],
        description: json["description"],
        updateAt: DateTime.parse(json["updateAt"]),
        avatar: json["avatar"],
        createAt: DateTime.parse(json["createAt"]),
        following: List<String>.from(json["following"].map((x) => x)),
        saveJob: List<String>.from(json["saveJob"].map((x) => x)),
        skill: json["skill"] != null
            ? List<String>.from(json["skill"].map((x) => x))
            : null,
        name: json["name"],
        email: json["email"],
        website: json["website"],
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : null,
        isAccept: json["isAccept"],
        industry: json["industry"],
        employeeSize: json["employeeSize"],
        specialization: json["specialization"] != null
            ? List<String>.from(json["specialization"].map((x) => x))
            : null,
      );

  factory UserModel.fromJsonFirebase(Map<String, dynamic> json) => UserModel(
        birthday: (json["birthday"] as Timestamp).toDate(),
        address: json["address"],
        role: json["role"],
        follower: List<String>.from(json["follower"].map((x) => x)),
        gender: json["gender"],
        description: json["description"],
        updateAt: (json["updateAt"] as Timestamp).toDate(),
        avatar: json["avatar"],
        createAt: (json["createAt"] as Timestamp).toDate(),
        following: List<String>.from(json["following"].map((x) => x)),
        saveJob: List<String>.from(json["saveJob"].map((x) => x)),
        skill: json["skill"] != null
            ? List<String>.from(json["skill"].map((x) => x))
            : null,
        name: json["name"],
        email: json["email"],
        website: json["website"],
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : null,
        isAccept: json["isAccept"],
        industry: json["industry"],
        employeeSize: json["employeeSize"],
        specialization: json["specialization"] != null
            ? List<String>.from(json["specialization"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() {
    return role == "business"
        ? {
            "birthday": birthday.toIso8601String(),
            "address": address,
            "role": role,
            "follower": follower,
            "description": description,
            "updateAt": updateAt.toIso8601String(),
            "avatar": avatar,
            "createAt": createAt.toIso8601String(),
            "following": following,
            "name": name,
            "email": email,
            "website": website,
            "images": images,
            "isAccept": isAccept,
            "industry": industry,
            "employeeSize": employeeSize,
            "specialization": specialization,
          }
        : {
            "birthday": birthday.toIso8601String(),
            "address": address,
            "role": role,
            "follower": follower,
            "gender": gender,
            "description": description,
            "updateAt": updateAt.toIso8601String(),
            "avatar": avatar,
            "createAt": createAt.toIso8601String(),
            "following": following,
            "skill": skill,
            "name": name,
            "email": email,
            "saveJob": saveJob,
          };
  }

  UserEntity toUserEntity() {
    return UserEntity(
      name: name,
      email: email,
      avatar: avatar,
      address: address,
      birthday: birthday,
      description: description,
      follower: follower,
      following: following,
      updateAt: updateAt,
      createAt: createAt,
      role: role,
      employeeSize: employeeSize,
      gender: gender,
      images: images,
      industry: industry,
      isAccept: isAccept,
      saveJob: saveJob,
      skill: skill,
      specialization: specialization,
      website: website,
    );
  }
}
