import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/add_appreciation_entity.dart';

class AddAppreciationModel {
  String awardName;
  String achievement;
  String description;
  DateTime endDate;

  AddAppreciationModel({
    required this.awardName,
    required this.achievement,
    required this.description,
    required this.endDate,
  });

  factory AddAppreciationModel.fromEntity(AddAppreciationEntity appreciation) {
    return AddAppreciationModel(
      awardName: appreciation.awardName,
      achievement: appreciation.achievement,
      description: appreciation.description,
      endDate: appreciation.endDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "awardName": awardName,
      "achievement": achievement,
      "description": description,
      "endDate": endDate,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
