import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

@LazySingleton(as: HomeAdminRepository)
class HomeAdminRepositoryImpl extends HomeAdminRepository {
  @override
  Future<DataState<List<CompanyEntity>>> getListCompanyPending() async {
    try {
      final response = await XCollection.user
          .where("role", isEqualTo: "business")
          .where("isAccept", isEqualTo: false)
          .get();
      List<CompanyEntity> listCompany = response.docs
          .map((e) => CompanyModel.fromDocumentSnapshot(e).toCompanyEntity())
          .toList();
      return DataSuccess(listCompany);
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
