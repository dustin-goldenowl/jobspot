part of 'company_profile_cubit.dart';

class CompanyProfileState extends Equatable {
  const CompanyProfileState({
    required this.isTop,
    this.listJob,
    this.listPost,
    this.user,
    this.error,
  });

  final bool isTop;
  final List<JobEntity>? listJob;
  final List<PostEntity>? listPost;
  final UserEntity? user;
  final String? error;

  CompanyProfileState copyWith({
    bool? isTop,
    List<JobEntity>? listJob,
    List<PostEntity>? listPost,
    UserEntity? user,
    String? error,
  }) {
    return CompanyProfileState(
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
