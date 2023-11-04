import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class PostModel {
  String id;
  String title;
  String description;
  String owner;
  int? numberOfComments;
  UserModel? user;
  List<String> images;
  List<String> like;
  List<String> comment;
  List<String> share;
  DateTime createAt;
  DateTime updateAt;

  PostModel({
    this.user,
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.like,
    required this.comment,
    required this.share,
    required this.owner,
    required this.createAt,
    required this.updateAt,
    this.numberOfComments,
  });

  factory PostModel.fromQueryDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return PostModel(
      id: snapshot.id,
      title: data["title"],
      description: data["description"],
      owner: data["owner"],
      images: List<String>.from(data["images"].map((x) => x)),
      like: List<String>.from(data["like"].map((x) => x)),
      comment: List<String>.from(data["comment"].map((x) => x)),
      share: List<String>.from(data["share"].map((x) => x)),
      createAt: (data["createAt"] as Timestamp).toDate(),
      updateAt: (data["updateAt"] as Timestamp).toDate(),
    );
  }

  factory PostModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return PostModel(
      id: snapshot.id,
      title: data["title"],
      description: data["description"],
      owner: data["owner"],
      images: List<String>.from(data["images"].map((x) => x)),
      like: List<String>.from(data["like"].map((x) => x)),
      comment: List<String>.from(data["comment"].map((x) => x)),
      share: List<String>.from(data["share"].map((x) => x)),
      createAt: (data["createAt"] as Timestamp).toDate(),
      updateAt: (data["updateAt"] as Timestamp).toDate(),
    );
  }

  factory PostModel.fromEntity(PostEntity entity) {
    return PostModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      images: entity.images,
      like: entity.like,
      comment: entity.comment,
      share: entity.share,
      owner: entity.owner,
      createAt: entity.createAt,
      updateAt: DateTime.now(),
    );
  }

  PostModel copyWith({
    String? title,
    String? description,
    UserModel? user,
    int? numberOfComments,
    List<String>? images,
    List<String>? like,
    List<String>? comment,
    List<String>? share,
  }) {
    return PostModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
      like: like ?? this.like,
      comment: comment ?? this.comment,
      share: share ?? this.share,
      user: user ?? this.user,
      owner: owner,
      numberOfComments: numberOfComments,
      createAt: createAt,
      updateAt: updateAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "images": images,
      "like": like,
      "comment": comment,
      "share": share,
      "owner": owner,
      "createAt": createAt,
      "updateAt": DateTime.now(),
    };
  }

  PostEntity toPostEntity() {
    final temptUser = UserEntity(
        id: "", name: "", avatar: "", address: "", role: UserRole.applicant);
    return PostEntity(
      user: user?.toUserEntity() ?? temptUser,
      id: id,
      title: title,
      description: description,
      numberOfComments: numberOfComments ?? 0,
      images: images,
      like: like,
      comment: comment,
      share: share,
      owner: owner,
      createAt: createAt,
    );
  }

  UpdatePostEntity toUpdatePostEntity() {
    return UpdatePostEntity(
      id: id,
      title: title,
      images: images,
      description: description,
      removeImages: [],
    );
  }
}
