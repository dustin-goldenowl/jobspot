import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@LazySingleton(as: SaveJobRepository)
class SaveJobRepositoryImpl extends SaveJobRepository {
  @override
  Stream<DataState<List<JobEntity>>> listenSaveJob() {
    try {
      return XCollection.user
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .asyncMap((event) async {
        List<String> listSaveJob =
            List<String>.from(event.data()!["saveJob"].map((x) => x));
        final response = await Future.wait(
          listSaveJob.map((e) => XCollection.job.doc(e).get()).toList(),
        );
        List<JobModel> listJob =
            response.map((e) => JobModel.fromDocumentSnapshot(e)).toList();
        final listCompany = await getListCompany(listJob);
        for (int i = 0; i < listJob.length; i++) {
          listJob[i].company = listCompany
              .firstWhere((element) => element.id == listJob[i].owner);
        }
        return DataSuccess(listJob.map((e) => e.toJobEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
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

  @override
  Future<DataState<bool>> deleteAllSaveJob() async {
    try {
      final user = UserModel.fromEntity(PrefsUtils.getUserInfo()!);
      user.saveJob!.clear();
      await Future.wait([
        XCollection.user
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"saveJob": []}),
        PrefsUtils.saveUserInfo(user.toJson()),
      ]);
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
