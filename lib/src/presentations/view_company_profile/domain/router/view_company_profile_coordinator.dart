import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class ViewCompanyProfileCoordinator {
  ViewCompanyProfileCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showFullPost({
    required PostEntity post,
    bool isComment = false,
  }) =>
      rootRouter.push(ViewPostRoute(post: post, isComment: isComment));

  static void showFullJob(String jobID) =>
      rootRouter.push(ViewJobRoute(jobID: jobID));

  static void showApplyJob(JobEntity job) =>
      rootRouter.push(ApplyJobRoute(job: job));

  static void viewFollow({
    List<String>? following,
    List<String>? follower,
    String? title,
    required int index,
  }) =>
      rootRouter.push(FollowRoute(
        follower: follower,
        following: following,
        title: title,
        index: index,
      ));

  static void showViewProfile({required String uid, required UserRole role}) {
    if (uid != FirebaseAuth.instance.currentUser!.uid) {
      if (role == UserRole.applicant) {
        rootRouter.push(ViewApplicantProfileRoute(uid: uid));
      } else {
        rootRouter.push(ViewCompanyProfileRoute(uid: uid));
      }
    }
  }
}
