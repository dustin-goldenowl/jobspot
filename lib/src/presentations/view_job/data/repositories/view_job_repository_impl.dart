import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart';

@LazySingleton(as: ViewJobRepository)
class ViewJobRepositoryImpl extends ViewJobRepository {
  @override
  Future<DataState<JobEntity>> getJobData(String id) async {
    try {
      final jobSnapshot =
          await FirebaseFirestore.instance.collection("jobs").doc(id).get();
      JobModel job = JobModel.fromDocumentSnapshot(jobSnapshot);
      final companySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(job.owner)
          .get();
      CompanyModel company = CompanyModel.fromDocumentSnapshot(companySnapshot);
      job.company = company;
      return DataSuccess(job.toJobEntity());
    } catch (e) {
      print(e);
      return DataFailed(e.toString());
    }
  }
}
