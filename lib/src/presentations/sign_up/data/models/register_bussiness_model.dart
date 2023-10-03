import 'package:jobspot/src/presentations/sign_up/domain/entities/register_bussiness_entity.dart';

class RegisterBussinessModel {
  final String name;
  final DateTime founding;
  final String headquarters;
  final String employeeSize;

  RegisterBussinessModel({
    required this.name,
    required this.employeeSize,
    required this.founding,
    required this.headquarters,
  });

  factory RegisterBussinessModel.fromEntity(RegisterBussinessEntity entity) {
    return RegisterBussinessModel(
      name: entity.name,
      employeeSize: entity.employeeSize,
      founding: entity.founding,
      headquarters: entity.headquarters,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "founding": founding,
      "headquarters": headquarters,
      "employeeSize": employeeSize,
      "avatar": null,
      "role": "bussiness",
      "description": "",
      "industry": "",
      "website": "",
      "isAccept": false,
      "images": [],
      "follower": [],
      "following": [],
      "posts": [],
      "jobs": [],
      "specialization": [],
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
