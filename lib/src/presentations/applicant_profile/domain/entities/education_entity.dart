class EducationEntity {
  final String id;
  final String levelEdu;
  final String institutionName;
  final String fieldStudy;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool isEduNow;

  EducationEntity({
    required this.id,
    required this.levelEdu,
    required this.institutionName,
    required this.fieldStudy,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isEduNow,
  });
}
