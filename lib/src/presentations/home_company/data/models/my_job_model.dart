import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/home_company/domain/entities/my_job_entity.dart';

class MyJobModel {
  String id;
  String position;
  int jobType;
  int salary;
  int level;
  int typeWorkplace;
  int? applicants;
  String jobPosition;
  DateTime startDate;
  DateTime endDate;

  MyJobModel({
    required this.id,
    required this.jobPosition,
    required this.jobType,
    required this.level,
    required this.position,
    required this.salary,
    required this.typeWorkplace,
    required this.endDate,
    required this.startDate,
    this.applicants,
  });

  factory MyJobModel.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return MyJobModel(
      id: snapshot.id,
      jobPosition: data["position"],
      jobType: data["jobType"],
      level: data["level"],
      position: data["position"],
      salary: data["salary"],
      typeWorkplace: data["typeWorkplace"],
      endDate: (data["endDate"] as Timestamp).toDate(),
      startDate: (data["startDate"] as Timestamp).toDate(),
    );
  }

  MyJobModel copyWith({int? applicants}) {
    return MyJobModel(
      id: id,
      jobPosition: jobPosition,
      jobType: jobType,
      level: level,
      position: position,
      salary: salary,
      typeWorkplace: typeWorkplace,
      endDate: endDate,
      startDate: startDate,
      applicants: applicants ?? this.applicants,
    );
  }

  MyJobEntity toMyJobEntity() {
    return MyJobEntity(
      applicants: applicants ?? 0,
      id: id,
      jobPosition: jobPosition,
      jobType: jobType,
      level: level,
      position: position,
      salary: salary,
      typeWorkplace: typeWorkplace,
      endDate: endDate,
      startDate: startDate,
    );
  }
}
