import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart';
import 'package:jobspot/src/presentations/home/data/models/company_model.dart';

class JobModel {
  String id;
  CompanyModel? company;
  String owner;
  String position;
  int jobType;
  int location;
  int salary;
  int level;
  int typeWorkplace;

  // TODO Temporarily for testing => will be deleted after completion
  String jobPosition;
  String description;
  DateTime startDate;
  DateTime endDate;

  JobModel({
    required this.id,
    required this.jobType,
    required this.location,
    required this.owner,
    required this.position,
    required this.salary,
    required this.typeWorkplace,
    required this.level,
    this.company,

    // TODO Temporarily for testing => will be deleted after completion
    required this.description,
    required this.endDate,
    required this.jobPosition,
    required this.startDate,
  });

  factory JobModel.fromDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return JobModel(
      id: snapshot.id,
      jobType: data["jobType"],
      location: data["location"],
      owner: data["owner"],
      position: data["position"],
      salary: data["salary"],
      typeWorkplace: data["typeWorkplace"],
      level: data["level"],

      // TODO Temporarily for testing => will be deleted after completion
      description: data["description"],
      endDate: (data["endDate"] as Timestamp).toDate(),
      jobPosition: data["position"],
      startDate: (data["startDate"] as Timestamp).toDate(),
    );
  }

  JobModel copyWith({CompanyModel? company}) {
    return JobModel(
      id: id,
      jobType: jobType,
      location: location,
      owner: owner,
      position: position,
      salary: salary,
      typeWorkplace: typeWorkplace,
      company: company,
      level: level,

      // TODO Temporarily for testing => will be deleted after completion
      description: description,
      endDate: endDate,
      jobPosition: jobPosition,
      startDate: startDate,
    );
  }

  // TODO Temporarily for testing => will be deleted after completion
  UpdateJobEntity toUpdateJobEntity() {
    return UpdateJobEntity(
      id: id,
      description: description,
      jobLocation: location,
      jobPosition: jobPosition,
      jobType: jobType,
      level: level,
      salary: salary,
      typeWorkplace: typeWorkplace,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
