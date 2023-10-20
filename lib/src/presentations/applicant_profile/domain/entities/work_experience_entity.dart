class WorkExperienceEntity {
  final String id;
  final String jobTitle;
  final String companyName;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool isWorkNow;

  WorkExperienceEntity({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isWorkNow,
  });
}
