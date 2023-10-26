import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/search_job/domain/repositories/search_job_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@LazySingleton(as: SearchJobRepository)
class SearchJobRepositoryImpl extends SearchJobRepository {
  @override
  Future<DataState<List<JobEntity>>> searchJob(SearchEntity entity) async {
    try {
      Query<Map<String, dynamic>> jobQuery = XCollection.job.where(
        "position",
        isGreaterThanOrEqualTo: entity.query.toLowerCase(),
        isLessThan: '${entity.query.toLowerCase()}z',
      );
      if (entity.location != null) {
        jobQuery = jobQuery.where("location", isEqualTo: entity.location);
      }
      final response = await jobQuery.get();
      List<JobModel> listJob =
          response.docs.map((e) => JobModel.fromDocumentSnapshot(e)).toList();
      final listCompany = await getListCompany(listJob);
      listJob = listJob
          .map(
            (e) => e.copyWith(
              company:
                  listCompany.firstWhere((element) => element.id == e.owner),
            ),
          )
          .toList();
      return DataSuccess(listJob.map((e) => e.toJobEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<List<CompanyModel>> getListCompany(List<JobModel> datas) async {
    Set<String> listCompanyId = {};
    for (var data in datas) {
      listCompanyId.add(data.owner);
    }
    final companyData = await Future.wait(
        listCompanyId.map((id) => XCollection.user.doc(id).get()).toList());
    return companyData
        .map((e) => CompanyModel.fromDocumentSnapshot(e))
        .toList();
  }
}
