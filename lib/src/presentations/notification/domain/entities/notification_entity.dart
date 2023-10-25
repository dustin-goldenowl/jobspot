import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';

part 'notification_comment_entity.dart';
part 'notification_job_entity.dart';
part 'notification_post_entity.dart';

abstract class NotificationEntity {
  final String id;
  final UserEntity from;
  final String type;
  final String action;
  final bool isRead;
  final DateTime createAt;
  CommentEntity? comment;
  PostEntity? post;
  JobEntity? job;

  NotificationEntity({
    required this.id,
    required this.isRead,
    required this.from,
    required this.type,
    required this.action,
    required this.createAt,
    this.comment,
    this.job,
    this.post,
  });
}
