class AddJobEntity {
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

  AddJobEntity({
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
}
