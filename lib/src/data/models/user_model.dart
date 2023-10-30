import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';

class UserModel {
  //general
  String id;
  String name;
  UserRole role;
  String avatar;
  String email;
  DateTime birthday;
  String address;
  String description;
  List<String> follower;
  List<String> following;
  DateTime updateAt;
  DateTime createAt;

  //applicant
  bool? gender;
  List<String>? skill;
  List<String>? saveJob;

  //business
  VerifyStatus? verify;
  String? website;
  String? industry;
  String? employeeSize;
  String? type;
  List<String>? images;
  List<String>? specialization;

  UserModel({
    required this.id,
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
    this.verify,
    this.specialization,
    this.website,
    this.type,
  });

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      avatar: entity.avatar,
      address: entity.address,
      birthday: entity.birthday,
      description: entity.description,
      follower: entity.follower,
      following: entity.following,
      updateAt: entity.updateAt,
      createAt: entity.createAt,
      role: entity.role,
      employeeSize: entity.employeeSize,
      gender: entity.gender,
      images: entity.images,
      industry: entity.industry,
      verify: entity.verify,
      saveJob: entity.saveJob,
      skill: entity.skill,
      specialization: entity.specialization,
      website: entity.website,
      type: entity.type,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? "",
        birthday: DateTime.parse(json["birthday"]),
        address: json["address"],
        role: getUserRole(json["role"]),
        follower: List<String>.from(json["follower"].map((x) => x)),
        gender: json["gender"],
        description: json["description"],
        updateAt: DateTime.parse(json["updateAt"]),
        avatar: json["avatar"],
        createAt: DateTime.parse(json["createAt"]),
        following: List<String>.from(json["following"].map((x) => x)),
        saveJob: json["saveJob"] != null
            ? List<String>.from(json["saveJob"].map((x) => x))
            : null,
        skill: json["skill"] != null
            ? List<String>.from(json["skill"].map((x) => x))
            : null,
        name: json["name"],
        email: json["email"],
        website: json["website"],
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : null,
        verify: getVerifyStatus(json["verify"]),
        industry: json["industry"],
        employeeSize: json["employeeSize"],
        specialization: json["specialization"] != null
            ? List<String>.from(json["specialization"].map((x) => x))
            : null,
        type: json["type"],
      );

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return UserModel(
      id: snapshot.id,
      birthday: (data["birthday"] as Timestamp).toDate(),
      address: data["address"],
      role: getUserRole(data["role"]),
      follower: List<String>.from(data["follower"].map((x) => x)),
      gender: data["gender"],
      description: data["description"],
      updateAt: (data["updateAt"] as Timestamp).toDate(),
      avatar: data["avatar"],
      createAt: (data["createAt"] as Timestamp).toDate(),
      following: List<String>.from(data["following"].map((x) => x)),
      saveJob: data["saveJob"] != null
          ? List<String>.from(data["saveJob"].map((x) => x))
          : null,
      skill: data["skill"] != null
          ? List<String>.from(data["skill"].map((x) => x))
          : null,
      name: data["name"],
      email: data["email"],
      website: data["website"],
      images: data["images"] != null
          ? List<String>.from(data["images"].map((x) => x))
          : null,
      verify: getVerifyStatus(data["verify"]),
      industry: data["industry"],
      employeeSize: data["employeeSize"],
      specialization: data["specialization"] != null
          ? List<String>.from(data["specialization"].map((x) => x))
          : null,
      type: data["type"],
    );
  }

  Map<String, dynamic> toJson() {
    return role == UserRole.business
        ? {
            "birthday": birthday.toIso8601String(),
            "address": address,
            "role": role.name,
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
            "verify": verify!.name,
            "industry": industry,
            "employeeSize": employeeSize,
            "specialization": specialization,
            "type": type,
          }
        : {
            "birthday": birthday.toIso8601String(),
            "address": address,
            "role": role.name,
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
      id: id,
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
      verify: verify,
      saveJob: saveJob,
      skill: skill,
      specialization: specialization,
      website: website,
      type: type,
    );
  }
}
