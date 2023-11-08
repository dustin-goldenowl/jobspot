class SharePostEntity {
  String description;
  String postID;
  List<String> share;
  String toUid;

  SharePostEntity({
    required this.description,
    required this.postID,
    required this.share,
    required this.toUid,
  });
}
