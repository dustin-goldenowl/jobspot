import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/add_work_experience_entity.dart';

class AddWorkExperienceModel {
  String jobTitle;
  String companyName;
  String description;
  DateTime startDate;
  DateTime endDate;
  bool isWorkNow;

  AddWorkExperienceModel({
    required this.jobTitle,
    required this.companyName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isWorkNow,
  });

  factory AddWorkExperienceModel.fromEntity(
      AddWorkExperienceEntity experience) {
    return AddWorkExperienceModel(
      jobTitle: experience.jobTitle,
      companyName: experience.companyName,
      description: experience.description,
      startDate: experience.startDate,
      endDate: experience.endDate,
      isWorkNow: experience.isWorkNow,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "jobTitle": jobTitle,
      "companyName": companyName,
      "description": description,
      "startDate": startDate,
      "endDate": endDate,
      "isWorkNow": isWorkNow,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
