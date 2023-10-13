import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/reply_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';

abstract class ViewPostRepository {
  Future<DataState<List<CommentEntity>>> getCommentFirstLevel(
      List<String> listComment);

  Future<DataState<List<CommentEntity>>> getReplyComment(String id);

  Stream<DataState<PostEntity>> syncPostData(String id);

  Future<DataState<bool>> sendComment(SendCommentEntity comment);

  Future<DataState<bool>> replyComment(ReplyCommentEntity comment);

  Future<DataState<bool>> favouritePost(FavouriteEntity favourite);

  Future<DataState<bool>> favouriteComment(FavouriteEntity favourite);
}
