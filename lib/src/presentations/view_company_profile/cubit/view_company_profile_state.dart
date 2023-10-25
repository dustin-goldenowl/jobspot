part of 'view_company_profile_cubit.dart';

class ViewCompanyProfileState extends Equatable {
  const ViewCompanyProfileState({
    this.listJob,
    this.listPost,
    this.user,
    this.error,
    required this.isTop,
  });

  final bool isTop;
  final List<JobEntity>? listJob;
  final List<PostEntity>? listPost;
  final UserEntity? user;
  final String? error;

  ViewCompanyProfileState copyWith(
      {bool? isTop,
      List<JobEntity>? listJob,
      List<PostEntity>? listPost,
      UserEntity? user,
      String? error}) {
    return ViewCompanyProfileState(
      isTop: isTop ?? this.isTop,
      listJob: listJob ?? this.listJob,
      listPost: listPost ?? this.listPost,
      user: user ?? this.user,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isTop, listJob, listPost, user, error];
}
