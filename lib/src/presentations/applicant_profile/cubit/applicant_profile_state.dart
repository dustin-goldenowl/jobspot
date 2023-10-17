part of 'applicant_profile_cubit.dart';

class ApplicantProfileState extends Equatable {
  const ApplicantProfileState({
    this.listPost,
    this.listExperience,
    this.error,
    required this.isTop,
    required this.isLoading,
  });

  final List<PostEntity>? listPost;
  final List<WorkExperienceEntity>? listExperience;
  final bool isTop;
  final bool isLoading;
  final String? error;

  ApplicantProfileState copyWith({
    List<PostEntity>? listPost,
    List<WorkExperienceEntity>? listExperience,
    String? error,
    bool? isTop,
    bool isLoading = false,
  }) {
    return ApplicantProfileState(
      listPost: listPost ?? this.listPost,
      listExperience: listExperience ?? this.listExperience,
      error: error,
      isTop: isTop ?? this.isTop,
      isLoading: isLoading,
    );
  }

  @override
  List<Object?> get props =>
      [listPost, isTop, isLoading, listExperience, error];
}
