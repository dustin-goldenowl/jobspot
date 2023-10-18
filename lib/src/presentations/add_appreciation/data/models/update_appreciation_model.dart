import 'package:jobspot/src/presentations/add_appreciation/domain/entities/update_appreciation_entity.dart';

class UpdateAppreciationModel {
  String id;
  String awardName;
  String achievement;
  String description;
  DateTime endDate;

  UpdateAppreciationModel({
    required this.id,
    required this.awardName,
    required this.achievement,
    required this.description,
    required this.endDate,
  });

  factory UpdateAppreciationModel.fromEntity(
      UpdateAppreciationEntity appreciation) {
    return UpdateAppreciationModel(
      id: appreciation.id,
      awardName: appreciation.awardName,
      achievement: appreciation.achievement,
      description: appreciation.description,
      endDate: appreciation.endDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "awardName": awardName,
      "achievement": achievement,
      "description": description,
      "endDate": endDate,
      "updateAt": DateTime.now(),
    };
  }
}
