class SendNotificationEntity {
  final String to;
  final String type;
  final String action;

  SendNotificationEntity({
    required this.action,
    required this.to,
    required this.type,
  });
}
