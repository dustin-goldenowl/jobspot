import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@lazySingleton
class SyncPostDataUseCase extends StreamUseCase<DataState<PostEntity>, String> {
  final ViewPostRepository _repository;

  SyncPostDataUseCase(this._repository);

  @override
  Stream<DataState<PostEntity>> call({required String params}) {
    return _repository.syncPostData(params);
  }
}
