import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';

class EducationModel {
  final String id;
  final String levelEdu;
  final String institutionName;
  final String fieldStudy;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool isEduNow;

  EducationModel({
    required this.id,
    required this.levelEdu,
    required this.institutionName,
    required this.fieldStudy,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isEduNow,
  });

  factory EducationModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return EducationModel(
      id: snapshot.id,
      levelEdu: data["levelEdu"],
      institutionName: data["institutionName"],
      fieldStudy: data["fieldStudy"],
      description: data["description"],
      startDate: (data["startDate"] as Timestamp).toDate(),
      endDate: (data["endDate"] as Timestamp).toDate(),
      isEduNow: data["isEduNow"],
    );
  }

  factory EducationModel.fromEntity(EducationEntity entity) {
    return EducationModel(
      id: entity.id,
      levelEdu: entity.levelEdu,
      institutionName: entity.institutionName,
      fieldStudy: entity.fieldStudy,
      description: entity.description,
      startDate: entity.startDate,
      endDate: entity.endDate,
      isEduNow: entity.isEduNow,
    );
  }

  UpdateEducationEntity toUpdateEducationEntity() {
    return UpdateEducationEntity(
      id: id,
      levelEdu: levelEdu,
      institutionName: institutionName,
      fieldStudy: fieldStudy,
      description: description,
      startDate: startDate,
      endDate: endDate,
      isEduNow: isEduNow,
    );
  }

  EducationEntity toEducationEntity() {
    return EducationEntity(
      id: id,
      levelEdu: levelEdu,
      institutionName: institutionName,
      fieldStudy: fieldStudy,
      description: description,
      startDate: startDate,
      endDate: endDate,
      isEduNow: isEduNow,
    );
  }
}
