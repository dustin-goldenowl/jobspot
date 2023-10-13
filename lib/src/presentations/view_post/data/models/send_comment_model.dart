import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';

class SendCommentModel {
  final String content;
  final String post;

  SendCommentModel({
    required this.content,
    required this.post,
  });

  factory SendCommentModel.fromEntity(SendCommentEntity entity) {
    return SendCommentModel(
      content: entity.content,
      post: entity.post,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "post": post,
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "reply": [],
      "like": [],
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
