import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home/domain/entities/fetch_job_data.dart';
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  @override
  Stream<DataState<FetchJobData>> fetchJobData() {
    try {
      Timestamp time = Timestamp.fromDate(DateTime.now().getDate);
      return FirebaseFirestore.instance
          .collection("jobs")
          .where("startDate", isLessThanOrEqualTo: time)
          .orderBy("startDate", descending: true)
          .snapshots()
          .asyncMap((event) async {
        List<JobModel> jobs = [];
        for (var element in event.docs) {
          if ((element.data()["endDate"] as Timestamp).seconds >=
              time.seconds) {
            jobs.add(JobModel.fromDocumentSnapshot(element));
          }
          if (jobs.length > 20) break;
        }
        final response = await Future.wait([
          getListCompany(jobs),
          fulltime(time),
          parttime(time),
          remote(time),
        ]);
        final listCompany = response.first as List<CompanyModel>;
        jobs = jobs
            .map(
              (e) => e.copyWith(
                company:
                    listCompany.firstWhere((element) => element.id == e.owner),
              ),
            )
            .toList();
        return DataSuccess(FetchJobData(
          jobs: jobs.map((e) => e.toJobEntity()).toList(),
          fulltime: (response[1] as AggregateQuerySnapshot).count,
          parttime: (response[2] as AggregateQuerySnapshot).count,
          remote: (response[3] as AggregateQuerySnapshot).count,
        ));
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  Future<AggregateQuerySnapshot> parttime(Timestamp time) =>
      FirebaseFirestore.instance
          .collection("jobs")
          .where("endDate", isGreaterThanOrEqualTo: time)
          .where("jobType", isEqualTo: 1)
          .count()
          .get();

  Future<AggregateQuerySnapshot> remote(Timestamp time) =>
      FirebaseFirestore.instance
          .collection("jobs")
          .where("endDate", isGreaterThanOrEqualTo: time)
          .where("typeWorkplace", isEqualTo: 2)
          .count()
          .get();

  Future<AggregateQuerySnapshot> fulltime(Timestamp time) =>
      FirebaseFirestore.instance
          .collection("jobs")
          .where("endDate", isGreaterThanOrEqualTo: time)
          .where("jobType", isEqualTo: 0)
          .count()
          .get();

  Future<List<CompanyModel>> getListCompany(List<JobModel> datas) async {
    Set<String> listCompanyId = {};
    for (var data in datas) {
      listCompanyId.add(data.owner);
    }
    final companyData = await Future.wait(listCompanyId
        .map((id) =>
            FirebaseFirestore.instance.collection("users").doc(id).get())
        .toList());
    return companyData
        .map((e) => CompanyModel.fromDocumentSnapshot(e))
        .toList();
  }
}
