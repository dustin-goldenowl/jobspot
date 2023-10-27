import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/presentations/add_resume/data/models/add_resume_model.dart';
import 'package:jobspot/src/presentations/add_resume/domain/entities/add_resume_entity.dart';
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';

@LazySingleton(as: ResumeRepository)
class ResumeRepositoryImpl extends ResumeRepository {
  @override
  Future<DataState<String>> addResume(AddResumeEntity resume) async {
    try {
      final link = await FirebaseUtils.uploadImage(
        folder: "resumes",
        name: DateTime.now().microsecondsSinceEpoch.toString(),
        image: resume.path,
      );
      final model = AddResumeModel.fromEntity(resume)..file = link;
      final myDoc = XCollection.resume.doc();
      await myDoc.set(model.toJson());
      return DataSuccess(myDoc.id);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteResume(ResumeEntity resume) async {
    try {
      await Future.wait([
        FirebaseUtils.deleteImage(resume.file),
        XCollection.resume.doc(resume.id).delete(),
      ]);
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
