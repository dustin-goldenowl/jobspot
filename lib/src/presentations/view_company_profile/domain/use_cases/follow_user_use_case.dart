import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/repositories/view_company_profile_repository.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';

@lazySingleton
class FollowUserUseCase extends UseCase<DataState<bool>, FavouriteEntity> {
  final ViewCompanyProfileRepository _repository;

  FollowUserUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required FavouriteEntity params}) {
    return _repository.followUser(params);
  }
}
