import 'package:firebase_auth/firebase_auth.dart';

class ApplyModel {
  String description;
  String jobID;
  String resumeID;

  ApplyModel({
    required this.description,
    required this.jobID,
    required this.resumeID,
  });

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "jobID": jobID,
      "resumeID": resumeID,
      "isAccept": null,
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
