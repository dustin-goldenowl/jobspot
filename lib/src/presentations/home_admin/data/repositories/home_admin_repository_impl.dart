import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/fetch_company_data.dart';
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

@LazySingleton(as: HomeAdminRepository)
class HomeAdminRepositoryImpl extends HomeAdminRepository {
  @override
  Future<DataState<FetchCompanyData>> getListCompanyPending(int limit) async {
    try {
      final myCollection = XCollection.user
          .where("role", isEqualTo: "business")
          .where("isAccept", isEqualTo: false);
      final response = await Future.wait([
        myCollection.limit(limit).get(),
        myCollection.count().get(),
      ]);
      final listDoc = (response.first as QuerySnapshot<Map<String, dynamic>>);
      final count = (response.last as AggregateQuerySnapshot).count;

      List<CompanyEntity> listCompany = listDoc.docs
          .map((e) => CompanyModel.fromDocumentSnapshot(e).toCompanyEntity())
          .toList();
      return DataSuccess(FetchCompanyData(
        isMore: limit < count,
        companies: listCompany,
        limit: limit < count ? limit : count,
      ));
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> considerCompany(ConsiderCompany consider) async {
    try {
      await XCollection.user
          .doc(consider.toUserID)
          .update({"isAccept": consider.isAccept});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
