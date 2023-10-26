import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart';

class UpdateJobModel {
  final int typeWorkplace;
  final int jobType;
  final int jobLocation;
  final int level;
  final int salary;
  final String jobPosition;
  final String description;
  final List<String> requirements;
  final DateTime startDate;
  final DateTime endDate;

  UpdateJobModel({
    required this.description,
    required this.jobLocation,
    required this.jobPosition,
    required this.jobType,
    required this.level,
    required this.salary,
    required this.typeWorkplace,
    required this.requirements,
    required this.startDate,
    required this.endDate,
  });

  factory UpdateJobModel.fromJobEntity(UpdateJobEntity entity) {
    return UpdateJobModel(
      description: entity.description,
      jobLocation: entity.jobLocation,
      jobPosition: entity.jobPosition,
      jobType: entity.jobType,
      level: entity.level,
      salary: entity.salary,
      typeWorkplace: entity.typeWorkplace,
      requirements: entity.requirements,
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "location": jobLocation,
      "position": jobPosition.toLowerCase(),
      "jobType": jobType,
      "level": level,
      "salary": salary,
      "typeWorkplace": typeWorkplace,
      "requirements": requirements,
      "startDate": startDate,
      "endDate": endDate,
      "updateAt": DateTime.now(),
    };
  }
}
