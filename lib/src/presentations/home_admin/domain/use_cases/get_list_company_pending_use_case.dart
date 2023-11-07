import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/verify_company_entity.dart';
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart';

@lazySingleton
class GetListCompanyPendingUseCase
    extends UseCase<DataState<FetchLazyData<VerifyCompanyEntity>>, int> {
  final HomeAdminRepository _repository;

  GetListCompanyPendingUseCase(this._repository);

  @override
  Future<DataState<FetchLazyData<VerifyCompanyEntity>>> call(
      {required int params}) {
    return _repository.getListCompanyPending(params);
  }
}
