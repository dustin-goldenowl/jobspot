import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';

class SharePostModel {
  String description;
  String postID;

  SharePostModel({required this.description, required this.postID});

  factory SharePostModel.fromEntity(SharePostEntity entity) {
    return SharePostModel(
      description: entity.description,
      postID: entity.postID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "sharePostID": postID,
      "description": description,
      "like": [],
      "comment": [],
      "share": [],
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
