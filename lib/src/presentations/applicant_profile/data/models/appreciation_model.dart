import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/update_appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';

class AppreciationModel {
  String id;
  String awardName;
  String achievement;
  String description;
  DateTime endDate;

  AppreciationModel({
    required this.id,
    required this.awardName,
    required this.achievement,
    required this.description,
    required this.endDate,
  });

  factory AppreciationModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return AppreciationModel(
      id: snapshot.id,
      awardName: data["awardName"],
      achievement: data["achievement"],
      description: data["description"],
      endDate: (data["endDate"] as Timestamp).toDate(),
    );
  }

  factory AppreciationModel.fromEntity(AppreciationEntity entity) {
    return AppreciationModel(
      id: entity.id,
      awardName: entity.awardName,
      achievement: entity.achievement,
      description: entity.description,
      endDate: entity.endDate,
    );
  }

  UpdateAppreciationEntity toUpdateAppreciationEntity() {
    return UpdateAppreciationEntity(
      id: id,
      awardName: awardName,
      achievement: achievement,
      description: description,
      endDate: endDate,
    );
  }

  AppreciationEntity toAppreciationEntity() {
    return AppreciationEntity(
      id: id,
      awardName: awardName,
      achievement: achievement,
      description: description,
      endDate: endDate,
    );
  }
}
