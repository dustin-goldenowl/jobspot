import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';

class SendCommentModel {
  final String owner;
  final String content;
  final String post;

  SendCommentModel({
    required this.content,
    required this.owner,
    required this.post,
  });

  factory SendCommentModel.fromEntity(SendCommentEntity entity) {
    return SendCommentModel(
      content: entity.content,
      owner: entity.owner,
      post: entity.post,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "content": content,
      "owner": owner,
      "post": post,
      "reply": [],
      "like": [],
      "createAt": DateTime.now(),
    };
  }
}
