import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

class ViewPostCoordinator {
  ViewPostCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showViewProfile({required String uid, required UserRole role}) {
    if (uid != FirebaseAuth.instance.currentUser!.uid) {
      if (role == UserRole.applicant) {
        rootRouter.push(ViewApplicantProfileRoute(uid: uid));
      } else {
        rootRouter.push(ViewCompanyProfileRoute(uid: uid));
      }
    }
  }

  static void showFullPost(PostEntity post) =>
      rootRouter.push(ViewPostRoute(post: post, isComment: false));

  static void showEditPost({required PostEntity post}) => rootRouter.push(
      AddPostRoute(post: PostModel.fromEntity(post).toUpdatePostEntity()));
}
