import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/constants/app_tags.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/view_post/data/models/comment_model.dart';

class NotificationModel {
  final String id;
  final String from;
  final UserModel? fromUser;
  final CommentModel? comment;
  final JobModel? job;
  final PostModel? post;
  final String type;
  final String action;
  final bool isRead;
  final DateTime createAt;
  final DateTime updateAt;

  NotificationModel({
    required this.id,
    required this.isRead,
    required this.from,
    this.fromUser,
    this.comment,
    this.post,
    this.job,
    required this.type,
    required this.action,
    required this.createAt,
    required this.updateAt,
  });

  factory NotificationModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return NotificationModel(
      id: snapshot.id,
      isRead: data["isRead"],
      from: data["from"],
      type: data["type"],
      action: data["action"],
      createAt: (data["createAt"] as Timestamp).toDate(),
      updateAt: (data["updateAt"] as Timestamp).toDate(),
    );
  }

  NotificationModel copyWith({
    UserModel? fromUser,
    CommentModel? comment,
    JobModel? job,
    PostModel? post,
  }) {
    return NotificationModel(
      id: id,
      isRead: isRead,
      from: from,
      type: type,
      action: action,
      createAt: createAt,
      updateAt: updateAt,
      fromUser: fromUser,
      comment: comment,
      job: job,
      post: post,
    );
  }

  NotificationEntity? toEntity() {
    final entity = switch (type) {
      AppTags.comment ||
      AppTags.favourite ||
      AppTags.share =>
        NotificationPostEntity(
          id: id,
          isRead: isRead,
          from: fromUser!.toUserEntity(),
          type: type,
          action: action,
          createAt: createAt,
          post: post!.toPostEntity(),
        ),
      AppTags.favouriteCmt || AppTags.reply => NotificationCommentEntity(
          id: id,
          isRead: isRead,
          from: fromUser!.toUserEntity(),
          type: type,
          action: action,
          comment: comment!.toCommentEntity(),
          createAt: createAt,
        ),
      AppTags.apply ||
      AppTags.accept ||
      AppTags.reject =>
        NotificationJobEntity(
          id: id,
          isRead: isRead,
          job: job!.toJobEntity(),
          from: fromUser!.toUserEntity(),
          type: type,
          action: action,
          createAt: createAt,
        ),
      _ => null
    };
    return entity;
  }
}
