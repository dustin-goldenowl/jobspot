import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/verify_company_entity.dart';

abstract class HomeAdminRepository {
  Future<DataState<FetchLazyData<VerifyCompanyEntity>>> getListCompanyPending(
      int limit);

  Future<DataState<bool>> considerCompany(ConsiderCompany consider);
}
