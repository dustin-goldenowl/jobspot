part of 'applicant_profile_cubit.dart';

class ApplicantProfileState extends Equatable {
  const ApplicantProfileState({
    this.listPost,
    this.listExperience,
    this.listEducation,
    this.listAppreciation,
    this.listResume,
    this.listSkill,
    this.error,
    required this.user,
    required this.isTop,
    required this.isLoading,
  });

  final List<PostEntity>? listPost;
  final List<WorkExperienceEntity>? listExperience;
  final List<EducationEntity>? listEducation;
  final List<AppreciationEntity>? listAppreciation;
  final List<ResumeEntity>? listResume;
  final List<SkillEntity>? listSkill;
  final UserEntity user;
  final bool isTop;
  final bool isLoading;
  final String? error;

  ApplicantProfileState copyWith({
    List<PostEntity>? listPost,
    List<WorkExperienceEntity>? listExperience,
    List<EducationEntity>? listEducation,
    List<AppreciationEntity>? listAppreciation,
    List<ResumeEntity>? listResume,
    List<SkillEntity>? listSkill,
    UserEntity? user,
    String? error,
    bool? isTop,
    bool isLoading = false,
  }) {
    return ApplicantProfileState(
      user: user ?? this.user,
      listPost: listPost ?? this.listPost,
      listExperience: listExperience ?? this.listExperience,
      listEducation: listEducation ?? this.listEducation,
      listAppreciation: listAppreciation ?? this.listAppreciation,
      listResume: listResume ?? this.listResume,
      listSkill: listSkill ?? this.listSkill,
      error: error,
      isTop: isTop ?? this.isTop,
      isLoading: isLoading,
    );
  }

  factory ApplicantProfileState.ds() {
    return ApplicantProfileState(
      user: PrefsUtils.getUserInfo()!.toUserEntity(),
      isTop: false,
      isLoading: false,
    );
  }

  @override
  List<Object?> get props => [
        user,
        listPost,
        isTop,
        isLoading,
        listExperience,
        listEducation,
        listAppreciation,
        listResume,
        listSkill,
        error,
      ];
}
