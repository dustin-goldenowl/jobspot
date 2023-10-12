import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class PostEntity {
  final String id;
  final String title;
  final String description;
  final String owner;
  final UserEntity user;
  final List<String> images;
  final List<String> like;
  final List<String> comment;
  final List<String> share;
  final DateTime createAt;

  PostEntity({
    required this.user,
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.like,
    required this.comment,
    required this.share,
    required this.owner,
    required this.createAt,
  });
}
