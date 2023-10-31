import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';
import 'package:jobspot/src/presentations/follow/domain/repositories/follow_repository.dart';

@LazySingleton(as: FollowRepository)
class FollowRepositoryImpl extends FollowRepository {
  @override
  Future<DataState<List<UserEntity>>> getListFollow(List<String> list) async {
    try {
      final response =
          await Future.wait(list.map((e) => XCollection.user.doc(e).get()));
      List<UserModel> listUser =
          response.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
      return DataSuccess(listUser.map((e) => e.toUserEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
