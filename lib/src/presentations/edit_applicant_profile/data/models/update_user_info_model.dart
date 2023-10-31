import 'package:jobspot/src/presentations/edit_applicant_profile/domain/entities/update_user_info_entity.dart';

class UpdateUserInfoModel {
  String avatar;
  String name;
  String address;
  bool gender;
  DateTime birthday;

  UpdateUserInfoModel({
    required this.avatar,
    required this.name,
    required this.address,
    required this.birthday,
    required this.gender,
  });

  factory UpdateUserInfoModel.fromEntity(UpdateUserInfoEntity entity) {
    return UpdateUserInfoModel(
      avatar: entity.avatar,
      name: entity.name,
      address: entity.address,
      birthday: entity.birthday,
      gender: entity.gender,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "avatar": avatar,
      "name": name,
      "address": address,
      "birthday": birthday,
      "gender": gender,
      "updateAt": DateTime.now(),
    };
  }
}
