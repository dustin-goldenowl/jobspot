import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

class FetchPostData {
  final List<PostEntity> posts;
  final bool isMore;
  final int limit;

  FetchPostData({
    required this.isMore,
    required this.posts,
    required this.limit,
  });
}
