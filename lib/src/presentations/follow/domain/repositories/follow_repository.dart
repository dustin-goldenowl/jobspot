import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

abstract class FollowRepository {
  Future<DataState<List<UserEntity>>> getListFollow(List<String> list);
}
