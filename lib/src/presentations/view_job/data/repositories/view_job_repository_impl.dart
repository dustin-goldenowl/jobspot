import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart';

@LazySingleton(as: ViewJobRepository)
class ViewJobRepositoryImpl extends ViewJobRepository {
  @override
  Future<DataState<JobEntity?>> getJobData(String id) async {
    try {
      final jobSnapshot = await XCollection.job.doc(id).get();
      if (jobSnapshot.exists) {
        JobModel job = JobModel.fromDocumentSnapshot(jobSnapshot);
        final companySnapshot = await XCollection.user.doc(job.owner).get();
        CompanyModel company =
            CompanyModel.fromDocumentSnapshot(companySnapshot);
        return DataSuccess(job.copyWith(company: company).toJobEntity());
      }
      return const DataSuccess(null);
    } catch (e) {
      log(e.toString());
      return DataFailed(e.toString());
    }
  }
}
