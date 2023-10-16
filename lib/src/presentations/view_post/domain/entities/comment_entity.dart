import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class CommentEntity {
  final String id;
  final List<String> reply;
  final List<String> like;
  final UserEntity user;
  final String content;
  final DateTime createAt;

  CommentEntity({
    required this.id,
    required this.content,
    required this.like,
    required this.reply,
    required this.createAt,
    required this.user,
  });
}
