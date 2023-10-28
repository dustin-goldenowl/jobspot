import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/fetch_company_data.dart';
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart';

@lazySingleton
class GetListCompanyPendingUseCase
    extends UseCase<DataState<FetchCompanyData>, int> {
  final HomeAdminRepository _repository;

  GetListCompanyPendingUseCase(this._repository);

  @override
  Future<DataState<FetchCompanyData>> call({required int params}) {
    return _repository.getListCompanyPending(params);
  }
}
