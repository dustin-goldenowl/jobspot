import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/reply_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@lazySingleton
class ReplyCommentUseCase extends UseCase<DataState<bool>, ReplyCommentEntity> {
  final ViewPostRepository _repository;

  ReplyCommentUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required ReplyCommentEntity params}) {
    return _repository.replyComment(params);
  }
}
