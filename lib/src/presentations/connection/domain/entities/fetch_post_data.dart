import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';

class FetchPostData {
  final List<PostModel> posts;
  final bool isMore;
  final int limit;

  FetchPostData({
    required this.isMore,
    required this.posts,
    required this.limit,
  });
}
