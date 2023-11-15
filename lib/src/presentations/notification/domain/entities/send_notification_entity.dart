class SendNotificationEntity {
  final String to;
  final String type;
  final String action;
  final String? navigationAction;

  SendNotificationEntity({
    required this.action,
    required this.to,
    required this.type,
    this.navigationAction,
  });
}
