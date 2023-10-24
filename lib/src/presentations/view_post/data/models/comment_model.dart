import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';

class CommentModel {
  final String id;
  final String owner;
  final List<String> reply;
  final List<String> like;
  final UserModel? user;
  final String content;
  final DateTime createAt;

  CommentModel({
    required this.id,
    required this.owner,
    required this.content,
    required this.like,
    required this.reply,
    required this.createAt,
    this.user,
  });

  factory CommentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return CommentModel(
      id: snapshot.id,
      owner: data["owner"],
      content: data["content"],
      like: List<String>.from(data["like"].map((x) => x)),
      reply: List<String>.from(data["reply"].map((x) => x)),
      createAt: (data["createAt"] as Timestamp).toDate(),
    );
  }

  CommentModel copyWith({UserModel? user}) {
    return CommentModel(
      id: id,
      owner: owner,
      content: content,
      like: like,
      reply: reply,
      createAt: createAt,
      user: user,
    );
  }

  CommentEntity toCommentEntity() => CommentEntity(
        id: id,
        content: content,
        like: like,
        reply: reply,
        createAt: createAt,
        user: user?.toUserEntity() ?? UserEntity(id: "", name: "", avatar: ""),
      );
}
