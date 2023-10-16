import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/reply_comment_entity.dart';

class ReplyCommentModel {
  String postID;
  String commentID;
  String content;

  ReplyCommentModel({
    required this.commentID,
    required this.content,
    required this.postID,
  });

  factory ReplyCommentModel.fromEntity(ReplyCommentEntity entity) {
    return ReplyCommentModel(
      commentID: entity.commentID,
      content: entity.content,
      postID: entity.postID,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "post": postID,
      "comment": commentID,
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "reply": [],
      "like": [],
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
