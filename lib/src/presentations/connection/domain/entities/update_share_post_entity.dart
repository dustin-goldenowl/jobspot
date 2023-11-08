part of 'share_post_base.dart';

class UpdateSharePostEntity extends SharePostBase {
  final String postID;

  UpdateSharePostEntity({
    required super.description,
    required this.postID,
  });
}
