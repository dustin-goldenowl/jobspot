import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart';

@lazySingleton
class FetchPostUseCase
    extends StreamUseCase<DataState<FetchLazyData<PostEntity>>, int> {
  final ConnectionRepository _repository;

  FetchPostUseCase(this._repository);

  @override
  Stream<DataState<FetchLazyData<PostEntity>>> call({required int params}) {
    return _repository.fetchPostData(params);
  }
}
