import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@lazySingleton
class FavouritePostUseCase extends UseCase<DataState<bool>, FavouriteEntity> {
  final ViewPostRepository _repository;

  FavouritePostUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required FavouriteEntity params}) {
    return _repository.favouritePost(params);
  }
}
