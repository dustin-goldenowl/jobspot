part of 'company_profile_cubit.dart';

class CompanyProfileState extends Equatable {
  const CompanyProfileState({
    required this.isTop,
    required this.isLoading,
    this.listJob,
    this.listPost,
    this.user,
    this.error,
    this.saveJobID,
  });

  final bool isLoading;
  final bool isTop;
  final String? saveJobID;
  final List<JobEntity>? listJob;
  final List<PostEntity>? listPost;
  final UserEntity? user;
  final String? error;

  CompanyProfileState copyWith({
    bool? isTop,
    bool isLoading = false,
    List<JobEntity>? listJob,
    List<PostEntity>? listPost,
    UserEntity? user,
    String? error,
    String? saveJobID,
  }) {
    return CompanyProfileState(
      isLoading: isLoading,
      isTop: isTop ?? this.isTop,
      listJob: listJob ?? this.listJob,
      listPost: listPost ?? this.listPost,
      user: user ?? this.user,
      error: error,
      saveJobID: saveJobID,
    );
  }

  @override
  List<Object?> get props =>
      [isTop, listJob, listPost, user, error, isLoading, saveJobID];
}
