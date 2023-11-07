import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

class CompanyModel {
  String name;
  String avatar;
  String address;
  String id;

  CompanyModel({
    required this.id,
    required this.address,
    required this.avatar,
    required this.name,
  });

  factory CompanyModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return CompanyModel(
      id: snapshot.id,
      address: data["address"],
      avatar: data["avatar"],
      name: data["name"],
    );
  }

  CompanyEntity toCompanyEntity() =>
      CompanyEntity(id: id, address: address, avatar: avatar, name: name);
}
