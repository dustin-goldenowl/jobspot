import 'package:cloud_firestore/cloud_firestore.dart';
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
    );
  }
}
