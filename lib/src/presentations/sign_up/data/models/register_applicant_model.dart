import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';

class RegisterApplicantModel {
  final String fullname;
  final String email;
  final bool gender;
  final DateTime birthday;

  RegisterApplicantModel({
    required this.fullname,
    required this.email,
    required this.gender,
    required this.birthday,
  });

  factory RegisterApplicantModel.fromEntity(RegisterApplicantEntity entity) {
    return RegisterApplicantModel(
      fullname: entity.fullname,
      email: entity.email,
      gender: entity.gender,
      birthday: entity.birthday,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": fullname,
      "email": email,
      "gender": gender,
      "birthday": birthday,
      "address": "",
      "appreciation": [],
      "avatar": "",
      "role": "applicant",
      "description": "",
      "education": [],
      "follower": [],
      "following": [],
      "language": [],
      "resume": [],
      "skill": [],
      "workExperience": [],
      "saveJob": [],
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
