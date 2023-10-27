import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/constants/app_tags.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/resume_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart';
import 'package:jobspot/src/presentations/view_job_applicant/data/models/resume_applicant_model.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/consider_resume.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/resume_applicant_entity.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/repositories/view_job_applicant_repository.dart';

@LazySingleton(as: ViewJobApplicantRepository)
class ViewJobApplicantRepositoryImpl extends ViewJobApplicantRepository {
  final SendNotificationUseCase _sendNotificationUseCase;

  ViewJobApplicantRepositoryImpl(this._sendNotificationUseCase);

  @override
  Future<DataState<List<ResumeApplicantEntity>>> getListApplicant(
      String jobID) async {
    try {
      final response = await XCollection.apply
          .where("jobID", isEqualTo: jobID)
          .orderBy("createAt", descending: true)
          .get();
      List<ResumeApplicantModel> listResume = response.docs
          .map((e) => ResumeApplicantModel.fromDocumentSnapshot(e))
          .toList();

      final myResponse = await Future.wait([
        getListResume(listResume.map((e) => e.resumeID).toList()),
        getListUser(listResume.map((e) => e.owner).toList()),
      ]);
      final listApplicantResume = (myResponse.first as List<ResumeModel>);
      final listApplicant = (myResponse.last as List<UserModel>);

      int index = -1;
      listResume = listResume.map((e) {
        index++;
        return e.copyWith(
          applicant: listApplicant[index],
          resume: listApplicantResume[index],
        );
      }).toList();

      return DataSuccess(
          listResume.map((e) => e.toResumeApplicantEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<List<ResumeModel>> getListResume(List<String> list) async {
    final response =
        await Future.wait(list.map((e) => XCollection.resume.doc(e).get()));
    return response.map((e) => ResumeModel.fromDocumentSnapshot(e)).toList();
  }

  Future<List<UserModel>> getListUser(List<String> list) async {
    final response =
        await Future.wait(list.map((e) => XCollection.user.doc(e).get()));
    return response.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  }

  @override
  Future<DataState<bool>> considerResume(ConsiderResume consider) async {
    try {
      _sendNotificationUseCase.call(
          params: SendNotificationEntity(
        action: consider.jobID,
        to: consider.toUserID,
        type: consider.isAccept ? AppTags.accept : AppTags.reject,
      ));
      await XCollection.apply
          .doc(consider.applyID)
          .update({"isAccept": consider.isAccept});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
