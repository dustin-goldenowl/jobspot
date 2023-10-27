import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/home_company/data/models/my_job_model.dart';
import 'package:jobspot/src/presentations/home_company/domain/entities/fetch_my_job_data.dart';
import 'package:jobspot/src/presentations/home_company/domain/repositories/home_company_repository.dart';

@LazySingleton(as: HomeCompanyRepository)
class HomeCompanyRepositoryImpl extends HomeCompanyRepository {
  @override
  Future<DataState<FetchMyJobData>> getListMyJob(int limit) async {
    try {
      final myJobCollection = XCollection.job
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid);
      final response = await Future.wait([
        myJobCollection
            .limit(limit)
            .orderBy("startDate", descending: true)
            .get(),
        myJobCollection.count().get(),
      ]);
      final listJobDocs = response[0] as QuerySnapshot<Map<String, dynamic>>;
      final listApplicant =
          await getListApplicant(listJobDocs.docs.map((e) => e.id).toList());
      int index = 0;
      List<MyJobModel> listJob = listJobDocs.docs
          .map((e) => MyJobModel.fromDocument(e)
              .copyWith(applicants: listApplicant[index++]))
          .toList();
      int count = (response[1] as AggregateQuerySnapshot).count;
      return DataSuccess(FetchMyJobData(
        isMore: limit < count,
        jobs: listJob.map((e) => e.toMyJobEntity()).toList(),
        limit: limit < count ? limit : count,
      ));
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  Future<List<int>> getListApplicant(List<String> listJobID) async {
    final response = await Future.wait(listJobID
        .map(
            (e) => XCollection.apply.where("jobID", isEqualTo: e).count().get())
        .toList());
    return response.map((e) => e.count).toList();
  }
}
