import 'package:cloud_firestore/cloud_firestore.dart';

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
  List<String>? resume;
  List<String>? education;
  List<String>? workExperience;
  List<String>? appreciation;
  List<String>? language;
  List<String>? skill;

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
    required this.updateAt,
    required this.createAt,
    required this.resume,
    required this.role,
    required this.education,
    required this.gender,
    required this.workExperience,
    required this.appreciation,
    required this.language,
    required this.following,
    required this.skill,
    required this.employeeSize,
    required this.images,
    required this.industry,
    required this.isAccept,
    required this.specialization,
    required this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        birthday: DateTime.parse(json["birthday"]),
        resume: json["resume"] != null
            ? List<String>.from(json["resume"].map((x) => x))
            : null,
        address: json["address"],
        role: json["role"],
        education: json["education"] != null
            ? List<String>.from(json["education"].map((x) => x))
            : null,
        follower: List<String>.from(json["follower"].map((x) => x)),
        gender: json["gender"],
        workExperience: json["workExperience"] != null
            ? List<String>.from(json["workExperience"].map((x) => x))
            : null,
        appreciation: json["appreciation"] != null
            ? List<String>.from(json["appreciation"].map((x) => x))
            : null,
        description: json["description"],
        updateAt: DateTime.parse(json["updateAt"]),
        language: json["language"] != null
            ? List<String>.from(json["language"].map((x) => x))
            : null,
        avatar: json["avatar"],
        createAt: DateTime.parse(json["createAt"]),
        following: List<String>.from(json["following"].map((x) => x)),
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
        resume: json["resume"] != null
            ? List<String>.from(json["resume"].map((x) => x))
            : null,
        address: json["address"],
        role: json["role"],
        education: json["education"] != null
            ? List<String>.from(json["education"].map((x) => x))
            : null,
        follower: List<String>.from(json["follower"].map((x) => x)),
        gender: json["gender"],
        workExperience: json["workExperience"] != null
            ? List<String>.from(json["workExperience"].map((x) => x))
            : null,
        appreciation: json["appreciation"] != null
            ? List<String>.from(json["appreciation"].map((x) => x))
            : null,
        description: json["description"],
        updateAt: (json["updateAt"] as Timestamp).toDate(),
        language: json["language"] != null
            ? List<String>.from(json["language"].map((x) => x))
            : null,
        avatar: json["avatar"],
        createAt: (json["createAt"] as Timestamp).toDate(),
        following: List<String>.from(json["following"].map((x) => x)),
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
            "resume": resume,
            "address": address,
            "role": role,
            "education": education,
            "follower": follower,
            "gender": gender,
            "workExperience": workExperience,
            "appreciation": appreciation,
            "description": description,
            "updateAt": updateAt.toIso8601String(),
            "language": language,
            "avatar": avatar,
            "createAt": createAt.toIso8601String(),
            "following": following,
            "skill": skill,
            "name": name,
            "email": email,
          };
  }
}
