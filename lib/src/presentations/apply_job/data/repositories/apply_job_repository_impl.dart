import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_resume/domain/entities/add_resume_entity.dart';
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart';
import 'package:jobspot/src/presentations/apply_job/data/models/apply_model.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/apply_job_entity.dart';
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart';

@LazySingleton(as: ApplyJobRepository)
class ApplyJobRepositoryImpl extends ApplyJobRepository {
  final SendNotificationUseCase _sendNotificationUseCase;
  final AddResumeUseCase _addResumeUseCase;

  ApplyJobRepositoryImpl(this._sendNotificationUseCase, this._addResumeUseCase);

  @override
  Future<DataState<String>> applyJob(ApplyJobEntity apply) async {
    try {
      late String resumeID;
      if (apply.resume.id.isEmpty) {
        final resumeResponse = await _addResumeUseCase.call(
            params: AddResumeEntity(
          fileName: apply.resume.fileName,
          path: apply.resume.filePath,
          size: apply.resume.size,
        ));
        if (resumeResponse is DataSuccess) {
          resumeID = resumeResponse.data!;
        } else {
          return DataFailed(resumeResponse.error ?? "");
        }
      } else {
        resumeID = apply.resume.id;
      }
      ApplyModel model = ApplyModel(
        description: apply.description,
        jobID: apply.jobID,
        resumeID: resumeID,
      );
      _sendNotificationUseCase.call(
          params: SendNotificationEntity(
        action: apply.jobID,
        to: apply.uidJob,
        type: AppTags.apply,
      ));
      final doc = XCollection.apply.doc();
      await doc.set(model.toJson());
      return DataSuccess(doc.id);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
