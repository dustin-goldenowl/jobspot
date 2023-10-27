import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_resume/domain/entities/add_resume_entity.dart';
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart';
import 'package:jobspot/src/presentations/apply_job/data/models/apply_model.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart';

@LazySingleton(as: ApplyJobRepository)
class ApplyJobRepositoryImpl extends ApplyJobRepository {
  final SendNotificationUseCase _sendNotificationUseCase;
  final AddResumeUseCase _addResumeUseCase;

  ApplyJobRepositoryImpl(this._sendNotificationUseCase, this._addResumeUseCase);

  @override
  Future<DataState<bool>> applyJob(ResumeEntity resume) async {
    try {
      final resumeResponse = await _addResumeUseCase.call(
          params: AddResumeEntity(
        fileName: resume.fileName,
        path: resume.path,
        size: resume.size,
      ));
      if (resumeResponse is DataSuccess) {
        ApplyModel model = ApplyModel(
          description: resume.description,
          jobID: resume.jobID,
          resumeID: resumeResponse.data!,
        );
        _sendNotificationUseCase.call(
            params: SendNotificationEntity(
          action: resume.jobID,
          to: resume.uidJob,
          type: AppTags.apply,
        ));
        await XCollection.apply.doc().set(model.toJson());
        return DataSuccess(true);
      }
      return DataFailed(resumeResponse.error ?? "");
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
