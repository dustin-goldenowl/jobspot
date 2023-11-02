import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/home_admin/data/models/verify_company_model.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/fetch_company_data.dart';
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';

@LazySingleton(as: HomeAdminRepository)
class HomeAdminRepositoryImpl extends HomeAdminRepository {
  @override
  Future<DataState<FetchCompanyData>> getListCompanyPending(int limit) async {
    try {
      final myCollection = XCollection.user
          .where("role", isEqualTo: UserRole.business.name)
          .where("verify", isEqualTo: VerifyStatus.pending.name);
      final response = await Future.wait([
        myCollection.limit(limit).get(),
        myCollection.count().get(),
      ]);
      final listDoc = (response.first as QuerySnapshot<Map<String, dynamic>>);
      final count = (response.last as AggregateQuerySnapshot).count;
      List<VerifyCompanyModel> listVerifyCompany =
          await getListVerifyCompany(listDoc.docs.map((e) => e.id).toList());
      List<CompanyModel> listCompany = listDoc.docs
          .map((e) => CompanyModel.fromDocumentSnapshot(e))
          .toList();
      int index = 0;
      listVerifyCompany = listVerifyCompany
          .map((e) => e.copyWith(company: listCompany[index++]))
          .toList();
      return DataSuccess(FetchCompanyData(
        isMore: limit < count,
        companies: listVerifyCompany.map((e) => e.toEntity()).toList(),
        limit: limit < count ? limit : count,
      ));
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  Future<List<VerifyCompanyModel>> getListVerifyCompany(
      List<String> list) async {
    final response = await Future.wait(
        list.map((e) => XCollection.verifyBusiness.doc(e).get()).toList());
    return response
        .map((e) => VerifyCompanyModel.fromDocumentSnapshot(e))
        .toList();
  }

  @override
  Future<DataState<bool>> considerCompany(ConsiderCompany consider) async {
    try {
      await XCollection.user
          .doc(consider.toUserID)
          .update({"verify": consider.status.name});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}