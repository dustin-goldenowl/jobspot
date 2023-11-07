import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/update_work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';

class WorkExperienceModel {
  String id;
  String jobTitle;
  String companyName;
  String description;
  DateTime startDate;
  DateTime endDate;
  bool isWorkNow;

  WorkExperienceModel({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isWorkNow,
  });

  factory WorkExperienceModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return WorkExperienceModel(
      id: snapshot.id,
      jobTitle: data["jobTitle"],
      companyName: data["companyName"],
      description: data["description"],
      startDate: (data["startDate"] as Timestamp).toDate(),
      endDate: (data["endDate"] as Timestamp).toDate(),
      isWorkNow: data["isWorkNow"],
    );
  }

  factory WorkExperienceModel.fromEntity(WorkExperienceEntity entity) {
    return WorkExperienceModel(
      id: entity.id,
      jobTitle: entity.jobTitle,
      companyName: entity.companyName,
      description: entity.description,
      startDate: entity.startDate,
      endDate: entity.endDate,
      isWorkNow: entity.isWorkNow,
    );
  }

  UpdateWorkExperienceEntity toUpdateWorkExperienceEntity() {
    return UpdateWorkExperienceEntity(
      id: id,
      jobTitle: jobTitle,
      companyName: companyName,
      description: description,
      startDate: startDate,
      endDate: endDate,
      isWorkNow: isWorkNow,
    );
  }

  WorkExperienceEntity toWorkExperienceEntity() {
    return WorkExperienceEntity(
      id: id,
      jobTitle: jobTitle,
      companyName: companyName,
      description: description,
      startDate: startDate,
      endDate: endDate,
      isWorkNow: isWorkNow,
    );
  }
}
