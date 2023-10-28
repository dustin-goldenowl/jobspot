import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/fetch_company_data.dart';

abstract class HomeAdminRepository {
  Future<DataState<FetchCompanyData>> getListCompanyPending(int limit);

  Future<DataState<bool>> considerCompany(ConsiderCompany consider);
}
