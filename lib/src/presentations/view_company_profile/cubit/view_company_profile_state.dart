part of 'view_company_profile_cubit.dart';

class ViewCompanyProfileState extends Equatable {
  const ViewCompanyProfileState({
    this.listJob,
    this.listPost,
    this.user,
    this.error,
    this.saveJobID,
    required this.isTop,
  });

  final bool isTop;
  final String? saveJobID;
  final List<JobEntity>? listJob;
  final List<PostEntity>? listPost;
  final UserEntity? user;
  final String? error;

  ViewCompanyProfileState copyWith({
    bool? isTop,
    List<JobEntity>? listJob,
    List<PostEntity>? listPost,
    UserEntity? user,
    String? error,
    String? saveJobID,
  }) {
    return ViewCompanyProfileState(
      isTop: isTop ?? this.isTop,
      listJob: listJob ?? this.listJob,
      listPost: listPost ?? this.listPost,
      user: user ?? this.user,
      saveJobID: saveJobID,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isTop, listJob, listPost, user, error, saveJobID];
}
