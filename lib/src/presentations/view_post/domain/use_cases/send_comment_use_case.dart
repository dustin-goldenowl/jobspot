import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@lazySingleton
class SendCommentUseCase extends UseCase<DataState<bool>, SendCommentEntity> {
  final ViewPostRepository _repository;

  SendCommentUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required SendCommentEntity params}) {
    return _repository.sendComment(params);
  }
}
