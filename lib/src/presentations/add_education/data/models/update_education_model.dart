import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart';

class UpdateEducationModel {
  String id;
  String levelEdu;
  String institutionName;
  String fieldStudy;
  String description;
  DateTime startDate;
  DateTime endDate;
  bool isEduNow;

  UpdateEducationModel({
    required this.id,
    required this.levelEdu,
    required this.institutionName,
    required this.fieldStudy,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isEduNow,
  });

  factory UpdateEducationModel.fromEntity(UpdateEducationEntity education) {
    return UpdateEducationModel(
      id: education.id,
      levelEdu: education.levelEdu,
      institutionName: education.institutionName,
      fieldStudy: education.fieldStudy,
      description: education.description,
      startDate: education.startDate,
      endDate: education.endDate,
      isEduNow: education.isEduNow,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "levelEdu": levelEdu,
      "institutionName": institutionName,
      "fieldStudy": fieldStudy,
      "description": description,
      "startDate": startDate,
      "endDate": endDate,
      "isEduNow": isEduNow,
      "updateAt": DateTime.now(),
    };
  }
}
