import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@lazySingleton
class FetchDataCommentFirstLevelUseCase
    extends UseCase<DataState<List<CommentEntity>>, List<String>> {
  FetchDataCommentFirstLevelUseCase(this._repository);
  final ViewPostRepository _repository;

  @override
  Future<DataState<List<CommentEntity>>> call({required List<String> params}) {
    return _repository.getCommentFirstLevel(params);
  }
}
