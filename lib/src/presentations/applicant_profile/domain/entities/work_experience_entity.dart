class WorkExperienceEntity {
  String jobTitle;
  String companyName;
  String description;
  DateTime startDate;
  DateTime endDate;
  bool isWorkNow;

  WorkExperienceEntity({
    required this.jobTitle,
    required this.companyName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isWorkNow,
  });
}
