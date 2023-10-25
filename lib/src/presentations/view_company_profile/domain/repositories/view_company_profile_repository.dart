import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';

abstract class ViewCompanyProfileRepository {
  Future<DataState<List<JobEntity>>> getListJob(String uid);

  Future<DataState<bool>> followUser(FavouriteEntity entity);
}
