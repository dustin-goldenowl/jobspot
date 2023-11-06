class MyJobEntity {
  final String id;
  final String position;
  final int jobType;
  final int salary;
  final int level;
  final int typeWorkplace;
  final int applicants;
  final int? score;
  final String jobPosition;
  final List<int?>? resultIQ;
  final DateTime startDate;
  final DateTime endDate;

  MyJobEntity({
    required this.id,
    required this.jobPosition,
    required this.jobType,
    required this.level,
    required this.position,
    required this.salary,
    required this.applicants,
    required this.typeWorkplace,
    this.score,
    this.resultIQ,
    required this.endDate,
    required this.startDate,
  });
}
