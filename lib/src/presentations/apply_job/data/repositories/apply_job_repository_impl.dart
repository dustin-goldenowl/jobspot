import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/presentations/apply_job/data/models/resume_model.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart';

@LazySingleton(as: ApplyJobRepository)
class ApplyJobRepositoryImpl extends ApplyJobRepository {
  final SendNotificationUseCase _useCase;

  ApplyJobRepositoryImpl(this._useCase);

  @override
  Future<DataState<bool>> applyJob(ResumeEntity cv) async {
    try {
      final applyFirestore = XCollection.apply.doc();
      String cvUrl = await FirebaseUtils.uploadImage(
        folder: "cvs",
        name: DateTime.now().microsecondsSinceEpoch.toString(),
        image: cv.path,
      );
      ResumeModel cvModel = ResumeModel.fromCVEntity(cv)..file = cvUrl;
      _useCase.call(
          params: SendNotificationEntity(
        action: cv.jobID,
        to: cv.uidJob,
        type: AppTags.apply,
      ));
      await applyFirestore.set(cvModel.toJson());
      return DataSuccess(true);
    } catch (e) {
      print(e);
      return DataFailed(e.toString());
    }
  }
}
