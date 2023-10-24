import 'package:cloud_firestore/cloud_firestore.dart';

typedef FirebaseCollection = CollectionReference<Map<String, dynamic>>;

class XCollection {
  XCollection._();

  static final FirebaseFirestore instance = FirebaseFirestore.instance;

  static FirebaseCollection job = instance.collection("jobs");

  static FirebaseCollection language = instance.collection("languages");

  static FirebaseCollection post = instance.collection("posts");

  static FirebaseCollection skill = instance.collection("skills");

  static FirebaseCollection apply = instance.collection("applies");

  static FirebaseCollection user = instance.collection("users");

  static FirebaseCollection token = instance.collection("tokens");

  static FirebaseCollection education = instance.collection("educations");

  static FirebaseCollection jobPosition = instance.collection("jobPositions");

  static FirebaseCollection comment = instance.collection("comments");

  static FirebaseCollection notification = instance.collection("notifications");

  static FirebaseCollection appreciation = instance.collection("appreciations");

  static FirebaseCollection resume = instance.collection("resumes");

  static FirebaseCollection workExperience =
      instance.collection("workExperiences");
}
