import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

class FetchCompanyData {
  final List<CompanyEntity> companies;
  final bool isMore;
  final int limit;

  FetchCompanyData({
    required this.isMore,
    required this.companies,
    required this.limit,
  });
}
