import 'package:jobspot/src/presentations/home_admin/domain/entities/verify_company_entity.dart';

class FetchCompanyData {
  final List<VerifyCompanyEntity> companies;
  final bool isMore;
  final int limit;

  FetchCompanyData({
    required this.isMore,
    required this.companies,
    required this.limit,
  });
}
