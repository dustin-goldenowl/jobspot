import 'package:jobspot/src/presentations/add_work_experience/domain/entities/update_work_experience_entity.dart';

class UpdateWorkExperienceModel {
  String id;
  String jobTitle;
  String companyName;
  String description;
  DateTime startDate;
  DateTime endDate;
  bool isWorkNow;

  UpdateWorkExperienceModel({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isWorkNow,
  });

  factory UpdateWorkExperienceModel.fromEntity(
      UpdateWorkExperienceEntity experience) {
    return UpdateWorkExperienceModel(
      id: experience.id,
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
      "jobTitle": jobTitle,
      "companyName": companyName,
      "description": description,
      "startDate": startDate,
      "endDate": endDate,
      "isWorkNow": isWorkNow,
      "updateAt": DateTime.now(),
    };
  }
}
