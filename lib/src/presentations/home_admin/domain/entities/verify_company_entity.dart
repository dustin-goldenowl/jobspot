import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

class VerifyCompanyEntity {
  final CompanyEntity company;
  final String file;
  final String fileName;
  final String description;
  final int size;
  final DateTime createAt;

  VerifyCompanyEntity({
    required this.company,
    required this.file,
    required this.fileName,
    required this.description,
    required this.size,
    required this.createAt,
  });
}
