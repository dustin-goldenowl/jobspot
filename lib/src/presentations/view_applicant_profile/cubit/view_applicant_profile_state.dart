part of 'view_applicant_profile_cubit.dart';

class ViewApplicantProfileState extends Equatable {
  const ViewApplicantProfileState({
    this.listPost,
    this.listExperience,
    this.listEducation,
    this.listAppreciation,
    this.listResume,
    this.listSkill,
    this.listLanguage,
    this.user,
    this.error,
    required this.isTop,
    required this.isLoading,
  });

  final List<PostEntity>? listPost;
  final List<WorkExperienceEntity>? listExperience;
  final List<EducationEntity>? listEducation;
  final List<AppreciationEntity>? listAppreciation;
  final List<ResumeEntity>? listResume;
  final List<SkillEntity>? listSkill;
  final UserEntity? user;
  final List<LanguageEntity>? listLanguage;
  final bool isTop;
  final bool isLoading;
  final String? error;

  ViewApplicantProfileState copyWith({
    List<PostEntity>? listPost,
    List<WorkExperienceEntity>? listExperience,
    List<EducationEntity>? listEducation,
    List<AppreciationEntity>? listAppreciation,
    List<ResumeEntity>? listResume,
    List<SkillEntity>? listSkill,
    UserEntity? user,
    List<LanguageEntity>? listLanguage,
    String? error,
    bool? isTop,
    bool isLoading = false,
  }) {
    return ViewApplicantProfileState(
      user: user ?? this.user,
      listPost: listPost ?? this.listPost,
      listExperience: listExperience ?? this.listExperience,
      listEducation: listEducation ?? this.listEducation,
      listAppreciation: listAppreciation ?? this.listAppreciation,
      listResume: listResume ?? this.listResume,
      listSkill: listSkill ?? this.listSkill,
      listLanguage: listLanguage ?? this.listLanguage,
      error: error,
      isTop: isTop ?? this.isTop,
      isLoading: isLoading,
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
        listLanguage,
      ];
}
