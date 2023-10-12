import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/presentations/apply_job/data/models/cv_model.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/cv_entity.dart';
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart';

@LazySingleton(as: ApplyJobRepository)
class ApplyJobRepositoryImpl extends ApplyJobRepository {
  @override
  Future<DataState<bool>> applyJob(CVEntity cv) async {
    try {
      final applyFirestore =
          FirebaseFirestore.instance.collection("apply").doc();
      String cvUrl = await FirebaseUtils.uploadImage(
        folder: "cvs",
        name: DateTime.now().microsecondsSinceEpoch.toString(),
        image: cv.path,
      );
      CVModel cvModel = CVModel.fromCVEntity(cv)..file = cvUrl;
      await applyFirestore.set(cvModel.toJson());
      return DataSuccess(true);
    } catch (e) {
      print(e);
      return DataFailed(e.toString());
    }
  }
}