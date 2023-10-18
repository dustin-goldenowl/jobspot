import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/education_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/appreciation_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/work_experience_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

@LazySingleton(as: ApplicantProfileRepository)
class ApplicantProfileRepositoryImpl extends ApplicantProfileRepository {
  @override
  Stream<DataState<List<PostEntity>>> getListPost(int limit) {
    try {
      return FirebaseFirestore.instance
          .collection("posts")
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .limit(limit)
          .snapshots()
          .asyncMap((event) async {
        List<PostModel> listPost =
            event.docs.map((e) => PostModel.fromDocumentSnapshot(e)).toList();
        final response = await Future.wait(
            getListCommentPost(listPost.map((e) => e.id).toList()));
        final user = PrefsUtils.getUserInfo();
        UserModel userModel = UserModel(
          id: FirebaseAuth.instance.currentUser!.uid,
          name: user!.name,
          avatar: user.avatar,
        );
        int index = 0;
        listPost = listPost
            .map((e) => e.copyWith(
                user: userModel, numberOfComments: response[index++].count))
            .toList();
        return DataSuccess(listPost.map((e) => e.toPostEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  List<Future<AggregateQuerySnapshot>> getListCommentPost(List<String> listID) {
    return listID
        .map((e) => FirebaseFirestore.instance
            .collection("comments")
            .where("post", isEqualTo: e)
            .count()
            .get())
        .toList();
  }

  @override
  Future<DataState<bool>> deletePost(PostEntity post) async {
    try {
      FirebaseFirestore.instance
          .collection("comments")
          .where("post", isEqualTo: post.id)
          .get()
          .then((value) {
        for (var doc in value.docs) {
          FirebaseFirestore.instance
              .collection("comments")
              .doc(doc.id)
              .delete();
        }
      });
      for (var element in post.images) {
        FirebaseUtils.deleteImage(element);
      }
      await FirebaseFirestore.instance
          .collection("posts")
          .doc(post.id)
          .delete();
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Stream<DataState<List<WorkExperienceEntity>>> getWorkExperience() {
    try {
      return FirebaseFirestore.instance
          .collection("workExperiences")
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
      return FirebaseFirestore.instance
          .collection("educations")
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
      return FirebaseFirestore.instance
          .collection("appreciations")
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
}
