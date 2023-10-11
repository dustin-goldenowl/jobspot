import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

class JobEntity {
  final String id;
  final CompanyEntity company;
  final String owner;
  final String position;
  final int jobType;
  final int location;
  final int salary;
  final int level;
  final int typeWorkplace;
  final String jobPosition;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  JobEntity({
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
    required this.startDate,
    required this.company,
  });
}
