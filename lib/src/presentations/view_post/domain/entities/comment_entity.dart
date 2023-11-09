import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class CommentEntity {
  final String id;
  final String post;
  final String content;
  final String? hightLevel;
  final List<String> reply;
  final List<String> like;
  final UserEntity user;
  final DateTime createAt;

  CommentEntity({
    required this.id,
    required this.content,
    required this.post,
    required this.like,
    required this.reply,
    required this.createAt,
    required this.user,
    this.hightLevel,
  });
}
