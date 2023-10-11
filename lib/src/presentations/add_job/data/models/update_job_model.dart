import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart';

class UpdateJobModel {
  final int typeWorkplace;
  final int jobType;
  final int jobLocation;
  final int level;
  final int salary;
  final String jobPosition;
  final String description;
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
      startDate: entity.startDate,
      endDate: entity.endDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "location": jobLocation,
      "position": jobPosition,
      "jobType": jobType,
      "level": level,
      "salary": salary,
      "typeWorkplace": typeWorkplace,
      "startDate": startDate,
      "endDate": endDate,
      "updateAt": DateTime.now(),
    };
  }
}
