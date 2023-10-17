import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@lazySingleton
class DeleteCommentUseCase extends UseCase<DataState<bool>, String> {
  final ViewPostRepository _repository;

  DeleteCommentUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteComment(params);
  }
}
