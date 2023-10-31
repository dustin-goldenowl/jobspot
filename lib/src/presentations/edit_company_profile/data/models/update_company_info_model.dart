import 'package:jobspot/src/presentations/edit_company_profile/domain/entities/update_company_info_entity.dart';

class UpdateCompanyInfoModel {
  String avatar;
  String name;
  String address;
  String description;
  String website;
  String industry;
  String type;
  String employeeSize;
  String specialization;
  DateTime since;
  List<String> images;
  List<String> removeImages;

  UpdateCompanyInfoModel({
    required this.avatar,
    required this.name,
    required this.address,
    required this.since,
    required this.description,
    required this.employeeSize,
    required this.industry,
    required this.specialization,
    required this.type,
    required this.website,
    required this.images,
    required this.removeImages,
  });

  factory UpdateCompanyInfoModel.fromEntity(UpdateCompanyInfoEntity entity) {
    return UpdateCompanyInfoModel(
      avatar: entity.avatar,
      name: entity.name,
      address: entity.address,
      since: entity.since,
      description: entity.description,
      employeeSize: entity.employeeSize,
      industry: entity.industry,
      specialization: entity.specialization,
      type: entity.type,
      website: entity.website,
      images: entity.images,
      removeImages: entity.removeImages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "birthday": since,
      "address": address,
      "employeeSize": employeeSize,
      "avatar": avatar,
      "description": description,
      "industry": industry,
      "website": website,
      "type": type,
      "images": images,
      "specialization": specialization,
      "updateAt": DateTime.now(),
    };
  }
}
