import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/add_post_entity.dart';
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart';

@lazySingleton
class AddPostUseCase extends UseCase<DataState, AddPostEntity> {
  AddPostUseCase(this._repository);

  final AddPostRepository _repository;

  @override
  Future<DataState> call({required AddPostEntity params}) {
    return _repository.addPost(params);
  }
}
