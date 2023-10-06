class UpdatePostEntity {
  String id;
  String title;
  String description;
  List<String> images;
  List<String> removeImages;

  UpdatePostEntity({
    required this.id,
    required this.title,
    required this.images,
    required this.description,
    required this.removeImages,
  });
}
