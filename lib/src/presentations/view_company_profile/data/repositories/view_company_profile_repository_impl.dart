import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/repositories/view_company_profile_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';

@LazySingleton(as: ViewCompanyProfileRepository)
class ViewCompanyProfileRepositoryImpl extends ViewCompanyProfileRepository {
  @override
  Future<DataState<List<JobEntity>>> getListJob(String uid) async {
    try {
      final response =
          await XCollection.job.where("owner", isEqualTo: uid).get();
      List<JobModel> listJob =
          response.docs.map((e) => JobModel.fromDocumentSnapshot(e)).toList();
      final companySnapshot = await XCollection.user.doc(uid).get();
      CompanyModel company = CompanyModel.fromDocumentSnapshot(companySnapshot);
      listJob = listJob.map((e) => e.copyWith(company: company)).toList();
      return DataSuccess(listJob.map((e) => e.toJobEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> followUser(FavouriteEntity entity) async {
    try {
      await XCollection.user
          .doc(entity.id)
          .update({"follower": entity.listFavourite});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
