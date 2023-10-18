import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/presentations/add_resume/data/models/add_resume_model.dart';
import 'package:jobspot/src/presentations/add_resume/domain/entities/add_resume_entity.dart';
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart';

@LazySingleton(as: ResumeRepository)
class ResumeRepositoryImpl extends ResumeRepository {
  @override
  Future<DataState<bool>> addResume(AddResumeEntity resume) async {
    try {
      final link = await FirebaseUtils.uploadImage(
        folder: "resumes",
        name: DateTime.now().microsecondsSinceEpoch.toString(),
        image: resume.path,
      );
      final model = AddResumeModel.fromEntity(resume)..file = link;
      await FirebaseFirestore.instance
          .collection("resumes")
          .doc()
          .set(model.toJson());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteResume(String id) async {
    try {
      await FirebaseFirestore.instance.collection("resumes").doc(id).delete();
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
