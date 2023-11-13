class DeleteCommentEntity {
  final String postID;
  final String commentID;
  final String? highComment;
  final String? replyCommentID;

  DeleteCommentEntity({
    required this.postID,
    required this.commentID,
    required this.highComment,
    required this.replyCommentID,
  });
}
