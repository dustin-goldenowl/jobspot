import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/add_skill/data/models/skill_model.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/education_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/appreciation_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/resume_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/work_experience_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/get_post_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/data/models/user_model.dart' as user_model;

@LazySingleton(as: ApplicantProfileRepository)
class ApplicantProfileRepositoryImpl extends ApplicantProfileRepository {
  @override
  Stream<DataState<List<PostEntity>>> getListPost(GetPostEntity entity) {
    try {
      return XCollection.post
          .where("owner",
              isEqualTo: entity.uid ?? FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createAt", descending: true)
          .limit(entity.limit)
          .snapshots()
          .asyncMap((event) async {
        List<PostModel> listPost =
            event.docs.map((e) => PostModel.fromDocumentSnapshot(e)).toList();
        final response = await Future.wait([
          getListSharePost(listPost.map((e) => e.sharePostID).toSet()),
          ...getListCommentPost(listPost.map((e) => e.id).toList())
        ]);
        UserModel? userModel;
        if (entity.uid != null) {
          final response = await XCollection.user.doc(entity.uid).get();
          userModel = UserModel.fromDocumentSnapshot(response);
        } else {
          final user = PrefsUtils.getUserInfo();
          userModel = UserModel(
            id: FirebaseAuth.instance.currentUser!.uid,
            name: user!.name,
            avatar: user.avatar,
            address: user.address,
            role: user.role,
          );
        }
        int index = 1;
        final listSharePost = response[0] as List<PostModel>;
        listPost = listPost
            .map((e) => e.copyWith(
                  user: userModel,
                  numberOfComments:
                      (response[index++] as AggregateQuerySnapshot).count,
                  sharePost: e.sharePostID != null
                      ? listSharePost
                          .firstWhere((element) => element.id == e.sharePostID)
                      : null,
                ))
            .toList();
        return DataSuccess(listPost.map((e) => e.toPostEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  @override
  Future<List<PostModel>> getListSharePost(Set<String?> listPostID) async {
    final list = [...listPostID];
    list.remove(null);
    final response =
        await Future.wait(list.map((e) => XCollection.post.doc(e).get()));
    List<PostModel> listPost =
        response.map((e) => PostModel.fromDocumentSnapshot(e)).toList();
    final listUser = await getListUser(listPost.map((e) => e.owner).toSet());
    listPost = listPost
        .map((e) => e.copyWith(
            user: listUser.firstWhere((element) => element.id == e.owner)))
        .toList();
    return listPost;
  }

  @override
  Future<List<UserModel>> getListUser(Set<String> listID) async {
    final userData = await Future.wait(
        listID.map((id) => XCollection.user.doc(id).get()).toList());
    return userData.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  }

  List<Future<AggregateQuerySnapshot>> getListCommentPost(List<String> listID) {
    return listID
        .map((e) =>
            XCollection.comment.where("post", isEqualTo: e).count().get())
        .toList();
  }

  @override
  Future<DataState<bool>> deletePost(PostEntity post) async {
    try {
      XCollection.comment.where("post", isEqualTo: post.id).get().then((value) {
        for (var doc in value.docs) {
          XCollection.comment.doc(doc.id).delete();
        }
      });
      for (var element in post.images) {
        FirebaseUtils.deleteImage(element);
      }
      await XCollection.post.doc(post.id).delete();
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Stream<DataState<List<WorkExperienceEntity>>> getWorkExperience() {
    try {
      return XCollection.workExperience
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .asyncMap((event) async {
        List<WorkExperienceModel> listExperience = event.docs
            .map((e) => WorkExperienceModel.fromDocumentSnapshot(e))
            .toList();
        return DataSuccess(
            listExperience.map((e) => e.toWorkExperienceEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  @override
  Stream<DataState<List<EducationEntity>>> getEducation() {
    try {
      return XCollection.education
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .asyncMap((event) async {
        List<EducationModel> listExperience = event.docs
            .map((e) => EducationModel.fromDocumentSnapshot(e))
            .toList();
        return DataSuccess(
            listExperience.map((e) => e.toEducationEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  @override
  Stream<DataState<List<AppreciationEntity>>> getAppreciation() {
    try {
      return XCollection.appreciation
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .asyncMap((event) async {
        List<AppreciationModel> listExperience = event.docs
            .map((e) => AppreciationModel.fromDocumentSnapshot(e))
            .toList();
        return DataSuccess(
            listExperience.map((e) => e.toAppreciationEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  @override
  Stream<DataState<List<ResumeEntity>>> getResume() {
    try {
      return XCollection.resume
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .asyncMap((event) async {
        List<ResumeModel> listExperience =
            event.docs.map((e) => ResumeModel.fromDocumentSnapshot(e)).toList();
        return DataSuccess(
            listExperience.map((e) => e.toResumeEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  @override
  Stream<DataState<UserEntity>> getUserInfo() {
    try {
      return XCollection.user
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .asyncMap((event) async {
        final user = user_model.UserModel.fromDocumentSnapshot(event);
        await PrefsUtils.saveUserInfo(user.toJson());
        return DataSuccess(user.toUserEntity());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  @override
  Future<DataState<List<SkillEntity>>> getSkill(List<String> listSkill) async {
    try {
      final response = await Future.wait(
          listSkill.map((e) => XCollection.skill.doc(e).get()));
      return DataSuccess(response
          .map((e) => SkillModel.fromDocumentSnapshot(e).toSkillEntity())
          .toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> updateAboutMe(String description) async {
    try {
      await XCollection.user
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"description": description});
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
