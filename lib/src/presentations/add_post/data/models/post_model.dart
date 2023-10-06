import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/post_entity.dart';

class PostModel {
  String title;
  String description;
  List<String> images;

  PostModel({
    required this.title,
    required this.description,
    required this.images,
  });

  factory PostModel.fromPostEntity(PostEntity entity) {
    return PostModel(
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
      "like": [],
      "comment": [],
      "share": [],
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
