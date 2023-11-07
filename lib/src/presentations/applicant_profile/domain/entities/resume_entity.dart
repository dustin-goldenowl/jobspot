class ResumeEntity {
  final String id;
  final String fileName;
  final String filePath;
  final int size;
  final DateTime createAt;

  ResumeEntity({
    required this.id,
    required this.fileName,
    required this.filePath,
    required this.size,
    required this.createAt,
  });
}
