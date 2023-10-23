import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class NotificationEntity {
  final String id;
  final UserEntity from;
  final String type;
  final String action;
  final bool isRead;
  final DateTime createAt;
  final DateTime updateAt;

  NotificationEntity({
    required this.id,
    required this.isRead,
    required this.from,
    required this.type,
    required this.action,
    required this.createAt,
    required this.updateAt,
  });
}
