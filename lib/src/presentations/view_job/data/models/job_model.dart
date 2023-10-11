import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

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
  String jobPosition;
  String description;
  List<String> requirements;
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
    required this.description,
    required this.endDate,
    required this.jobPosition,
    required this.requirements,
    required this.startDate,
    this.company,
  });

  factory JobModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return JobModel(
      id: snapshot.id,
      jobType: data["jobType"],
      location: data["location"],
      owner: data["owner"],
      position: data["position"],
      salary: data["salary"],
      typeWorkplace: data["typeWorkplace"],
      level: data["level"],
      description: data["description"],
      endDate: (data["endDate"] as Timestamp).toDate(),
      requirements: List<String>.from(data["requirements"].map((x) => x)),
      jobPosition: data["position"],
      startDate: (data["startDate"] as Timestamp).toDate(),
    );
  }

  JobEntity toJobEntity() {
    return JobEntity(
      id: id,
      jobType: jobType,
      location: location,
      owner: owner,
      position: position,
      salary: salary,
      typeWorkplace: typeWorkplace,
      level: level,
      description: description,
      endDate: endDate,
      jobPosition: jobPosition,
      startDate: startDate,
      requirements: requirements,
      company: company!.toCompanyEntity(),
    );
  }
}
