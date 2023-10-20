import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/add_education_entity.dart';

class AddEducationModel {
  String levelEdu;
  String institutionName;
  String fieldStudy;
  String description;
  DateTime startDate;
  DateTime endDate;
  bool isEduNow;

  AddEducationModel({
    required this.levelEdu,
    required this.institutionName,
    required this.fieldStudy,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isEduNow,
  });

  factory AddEducationModel.fromEntity(AddEducationEntity education) {
    return AddEducationModel(
      levelEdu: education.levelEdu,
      institutionName: education.institutionName,
      fieldStudy: education.fieldStudy,
      description: education.description,
      startDate: education.startDate,
      endDate: education.endDate,
      isEduNow: education.isEduNow,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "levelEdu": levelEdu,
      "institutionName": institutionName,
      "fieldStudy": fieldStudy,
      "description": description,
      "startDate": startDate,
      "endDate": endDate,
      "isEduNow": isEduNow,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
