import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';

abstract class ViewPostRepository {
  Future<DataState<List<CommentEntity>>> getCommentFirstLevel(
      List<String> listComment);

  Stream<DataState<PostEntity>> syncPostData(String id);

  Future<DataState<bool>> sendComment(SendCommentEntity comment);
}
