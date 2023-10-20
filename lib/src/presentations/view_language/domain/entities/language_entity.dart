class LanguageEntity {
  final String id;
  final String name;
  final String code;
  final bool isFirst;
  final int oralLevel;
  final int writtenLevel;

  LanguageEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.isFirst,
    required this.oralLevel,
    required this.writtenLevel,
  });
}
