import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/entities/fetch_job_data.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/repositories/home_applicant_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';

@LazySingleton(as: HomeApplicantRepository)
class HomeApplicantRepositoryImpl extends HomeApplicantRepository {
  @override
  Stream<DataState<FetchJobData>> fetchJobData() {
    try {
      Timestamp time = Timestamp.fromDate(DateTime.now().getDate);
      return XCollection.job
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

  Future<AggregateQuerySnapshot> parttime(Timestamp time) => XCollection.job
      .where("endDate", isGreaterThanOrEqualTo: time)
      .where("jobType", isEqualTo: 1)
      .count()
      .get();

  Future<AggregateQuerySnapshot> remote(Timestamp time) => XCollection.job
      .where("endDate", isGreaterThanOrEqualTo: time)
      .where("typeWorkplace", isEqualTo: 2)
      .count()
      .get();

  Future<AggregateQuerySnapshot> fulltime(Timestamp time) => XCollection.job
      .where("endDate", isGreaterThanOrEqualTo: time)
      .where("jobType", isEqualTo: 0)
      .count()
      .get();

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

  @override
  Future<DataState<bool>> saveJob(String jobID) async {
    try {
      UserModel user = UserModel.fromEntity(PrefsUtils.getUserInfo()!);
      if (user.saveJob!.contains(jobID)) {
        user.saveJob!.remove(jobID);
      } else {
        user.saveJob!.add(jobID);
      }
      await Future.wait([
        XCollection.user.doc(FirebaseAuth.instance.currentUser!.uid).update({
          "saveJob": user.saveJob!,
        }),
        PrefsUtils.saveUserInfo(user.toJson()),
      ]);
      return DataSuccess(!user.saveJob!.contains(jobID));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
