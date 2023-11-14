import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/repositories/home_applicant_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';

@lazySingleton
class GetListCompanyUseCase extends UseCase<List<CompanyModel>, Set<String>> {
  final HomeApplicantRepository _repository;

  GetListCompanyUseCase(this._repository);

  @override
  Future<List<CompanyModel>> call({required Set<String> params}) {
    return _repository.getListCompany(params);
  }
}
