import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

abstract class HomeAdminRepository {
  Future<DataState<List<CompanyEntity>>> getListCompanyPending();

  Future<DataState<bool>> considerCompany(ConsiderCompany consider);
}
