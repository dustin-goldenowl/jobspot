import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@lazySingleton
class GetReplyCommentUseCase
    extends UseCase<DataState<List<CommentEntity>>, String> {
  final ViewPostRepository _repository;

  GetReplyCommentUseCase(this._repository);

  @override
  Future<DataState<List<CommentEntity>>> call({required String params}) {
    return _repository.getReplyComment(params);
  }
}
