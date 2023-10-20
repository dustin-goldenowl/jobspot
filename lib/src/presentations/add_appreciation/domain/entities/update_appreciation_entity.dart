class UpdateAppreciationEntity {
  final String id;
  final String awardName;
  final String achievement;
  final String description;
  final DateTime endDate;

  UpdateAppreciationEntity({
    required this.id,
    required this.awardName,
    required this.achievement,
    required this.description,
    required this.endDate,
  });
}
