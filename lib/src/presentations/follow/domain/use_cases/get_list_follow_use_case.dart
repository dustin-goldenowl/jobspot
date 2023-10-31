import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';
import 'package:jobspot/src/presentations/follow/domain/repositories/follow_repository.dart';

@lazySingleton
class GetListFollowUseCase
    extends UseCase<DataState<List<UserEntity>>, List<String>> {
  final FollowRepository _repository;

  GetListFollowUseCase(this._repository);

  @override
  Future<DataState<List<UserEntity>>> call({required List<String> params}) {
    return _repository.getListFollow(params);
  }
}
