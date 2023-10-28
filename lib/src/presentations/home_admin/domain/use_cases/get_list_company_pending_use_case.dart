import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

@lazySingleton
class GetListCompanyPendingUseCase
    extends UseCase<DataState<List<CompanyEntity>>, dynamic> {
  final HomeAdminRepository _repository;

  GetListCompanyPendingUseCase(this._repository);

  @override
  Future<DataState<List<CompanyEntity>>> call({params}) {
    return _repository.getListCompanyPending();
  }
}
