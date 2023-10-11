import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/job_entity.dart';

class JobModel {
  final int typeWorkplace;
  final int jobType;
  final int jobLocation;
  final int level;
  final int salary;
  final String jobPosition;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  JobModel({
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

  factory JobModel.fromPostEntity(JobEntity entity) {
    return JobModel(
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
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "description": description,
      "location": jobLocation,
      "position": jobPosition,
      "jobType": jobType,
      "level": level,
      "salary": salary,
      "typeWorkplace": typeWorkplace,
      "startDate": startDate,
      "endDate": endDate,
      "creatAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}