part of 'share_post_base.dart';

class SharePostEntity extends SharePostBase {
  final String postID;
  final List<String> share;
  final String toUid;

  SharePostEntity({
    required super.description,
    required this.postID,
    required this.share,
    required this.toUid,
  });
}
