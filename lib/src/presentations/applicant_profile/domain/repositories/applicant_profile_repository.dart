import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

abstract class ApplicantProfileRepository {
  Stream<DataState<List<PostEntity>>> getListPost(int limit);

  Future<DataState<bool>> deletePost(PostEntity post);
}
