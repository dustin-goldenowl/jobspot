import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart';

@lazySingleton
class ConsiderCompanyUseCase extends UseCase<DataState<bool>, ConsiderCompany> {
  final HomeAdminRepository _repository;

  ConsiderCompanyUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required ConsiderCompany params}) {
    return _repository.considerCompany(params);
  }
}
