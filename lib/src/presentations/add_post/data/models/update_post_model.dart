import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart';

class UpdatePostModel {
  String title;
  String description;
  List<String> images;

  UpdatePostModel({
    required this.description,
    required this.images,
    required this.title,
  });

  factory UpdatePostModel.fromEntity(UpdatePostEntity entity) {
    return UpdatePostModel(
      title: entity.title,
      description: entity.description,
      images: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "images": images,
      "updateAt": DateTime.now(),
    };
  }
}
