import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';

class RegisterApplicantModel {
  final String fullname;
  final bool gender;
  final DateTime birthday;

  RegisterApplicantModel({
    required this.fullname,
    required this.gender,
    required this.birthday,
  });

  factory RegisterApplicantModel.fromEntity(RegisterApplicantEntity entity) {
    return RegisterApplicantModel(
      fullname: entity.fullname,
      gender: entity.gender,
      birthday: entity.birthday,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "gender": gender,
      "birthday": birthday,
      "address": "",
      "appreciation": [],
      "avatar": null,
      "role": "applicant",
      "description": "",
      "education": [],
      "follower": [],
      "following": [],
      "language": [],
      "posts": [],
      "resume": [],
      "skill": [],
      "workExperience": [],
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
