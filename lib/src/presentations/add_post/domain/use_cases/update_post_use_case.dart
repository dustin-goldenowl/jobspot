import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart';
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart';

@lazySingleton
class UpdatePostUseCase extends UseCase<DataState, UpdatePostEntity> {
  final AddPostRepository _repository;

  UpdatePostUseCase(this._repository);

  @override
  Future<DataState> call({required UpdatePostEntity params}) {
    return _repository.updatePost(params);
  }
}
