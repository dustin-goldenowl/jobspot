class JobEntity {
  final int typeWorkplace;
  final int jobType;
  final int jobLocation;
  final int level;
  final int salary;
  final String jobPosition;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  JobEntity({
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
}
