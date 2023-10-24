import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/repositories/view_company_profile_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@LazySingleton(as: ViewCompanyProfileRepository)
class ViewCompanyProfileRepositoryImpl extends ViewCompanyProfileRepository {
  @override
  Future<DataState<List<JobEntity>>> getListJob(String uid) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("jobs")
          .where("owner", isEqualTo: uid)
          .get();
      final listJob =
          response.docs.map((e) => JobModel.fromDocumentSnapshot(e)).toList();
      return DataSuccess(listJob.map((e) => e.toJobEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
