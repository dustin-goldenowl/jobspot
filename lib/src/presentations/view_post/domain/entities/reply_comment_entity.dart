class ReplyCommentEntity {
  final String postID;
  final String commentID;
  final String content;
  final String uidPost;
  final String uidComment;

  ReplyCommentEntity({
    required this.postID,
    required this.commentID,
    required this.content,
    required this.uidComment,
    required this.uidPost,
  });
}
