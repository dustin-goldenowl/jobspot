import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';

class CommentModel {
  final String id;
  final String owner;
  final String post;
  final String? higthLevel;
  final String? comment;
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
    required this.post,
    this.higthLevel,
    this.comment,
    this.user,
  });

  factory CommentModel.fromSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return CommentModel(
      id: snapshot.id,
      higthLevel: data["highLevel"],
      comment: data["comment"],
      owner: data["owner"],
      post: data["post"],
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
      post: post,
      higthLevel: higthLevel,
      comment: comment,
    );
  }

  CommentEntity toCommentEntity() {
    final temptUser = UserEntity(
        id: "", name: "", avatar: "", address: "", role: UserRole.applicant);
    return CommentEntity(
      id: id,
      content: content,
      post: post,
      like: like,
      reply: reply,
      createAt: createAt,
      hightLevel: higthLevel,
      user: user?.toUserEntity() ?? temptUser,
      comment: comment,
    );
  }
}
