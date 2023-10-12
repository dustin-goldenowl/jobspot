class SendCommentEntity {
  final String owner;
  final String content;
  final String post;

  SendCommentEntity({
    required this.content,
    required this.owner,
    required this.post,
  });
}
