part of 'applicant_profile_cubit.dart';

class ApplicantProfileState extends Equatable {
  const ApplicantProfileState({
    this.listPost,
    this.listExperience,
    this.listEducation,
    this.listAppreciation,
    this.error,
    required this.isTop,
    required this.isLoading,
  });

  final List<PostEntity>? listPost;
  final List<WorkExperienceEntity>? listExperience;
  final List<EducationEntity>? listEducation;
  final List<AppreciationEntity>? listAppreciation;
  final bool isTop;
  final bool isLoading;
  final String? error;

  ApplicantProfileState copyWith({
    List<PostEntity>? listPost,
    List<WorkExperienceEntity>? listExperience,
    List<EducationEntity>? listEducation,
    List<AppreciationEntity>? listAppreciation,
    String? error,
    bool? isTop,
    bool isLoading = false,
  }) {
    return ApplicantProfileState(
      listPost: listPost ?? this.listPost,
      listExperience: listExperience ?? this.listExperience,
      listEducation: listEducation ?? this.listEducation,
      listAppreciation: listAppreciation ?? this.listAppreciation,
      error: error,
      isTop: isTop ?? this.isTop,
      isLoading: isLoading,
    );
  }

  @override
  List<Object?> get props => [
        listPost,
        isTop,
        isLoading,
        listExperience,
        listEducation,
        error,
        listAppreciation
      ];
}
