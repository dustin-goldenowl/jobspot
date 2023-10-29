import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/verify_company_entity.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';

class VerifyCompanyModel {
  final CompanyModel? company;
  final String file;
  final String fileName;
  final String description;
  final int size;
  final DateTime createAt;

  VerifyCompanyModel({
    this.company,
    required this.file,
    required this.fileName,
    required this.description,
    required this.size,
    required this.createAt,
  });

  factory VerifyCompanyModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return VerifyCompanyModel(
      file: data["file"],
      fileName: data["fileName"],
      description: data["description"],
      size: data["size"],
      createAt: (data["createAt"] as Timestamp).toDate(),
    );
  }

  VerifyCompanyModel copyWith({CompanyModel? company}) {
    return VerifyCompanyModel(
      company: company,
      file: file,
      fileName: fileName,
      size: size,
      createAt: createAt,
      description: description,
    );
  }

  VerifyCompanyEntity toEntity() {
    return VerifyCompanyEntity(
      company: company!.toCompanyEntity(),
      file: file,
      fileName: fileName,
      description: description,
      size: size,
      createAt: createAt,
    );
  }
}
