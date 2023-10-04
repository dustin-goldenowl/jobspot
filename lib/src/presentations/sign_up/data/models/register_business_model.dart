import 'package:jobspot/src/presentations/sign_up/domain/entities/register_business_entity.dart';

class RegisterBusinessModel {
  final String name;
  final DateTime founding;
  final String headquarters;
  final String employeeSize;

  RegisterBusinessModel({
    required this.name,
    required this.employeeSize,
    required this.founding,
    required this.headquarters,
  });

  factory RegisterBusinessModel.fromEntity(RegisterBusinessEntity entity) {
    return RegisterBusinessModel(
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
      "role": "business",
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
