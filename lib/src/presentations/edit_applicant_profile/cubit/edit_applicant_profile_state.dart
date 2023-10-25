part of 'edit_applicant_profile_cubit.dart';

class EditApplicantProfileState extends Equatable {
  const EditApplicantProfileState({
    required this.isLoading,
    required this.isTop,
    required this.birthday,
    required this.isMale,
    required this.avatar,
    this.error,
  });

  final bool isMale;
  final bool isLoading;
  final bool isTop;
  final DateTime birthday;
  final String avatar;
  final String? error;

  factory EditApplicantProfileState.ds() {
    UserEntity user = PrefsUtils.getUserInfo()!;
    return EditApplicantProfileState(
      isLoading: false,
      isTop: false,
      birthday: user.birthday,
      avatar: user.avatar,
      isMale: user.gender ?? false,
    );
  }

  EditApplicantProfileState copyWith({
    bool isLoading = false,
    bool? isMale,
    bool? isTop,
    DateTime? birthday,
    String? avatar,
    String? error,
  }) {
    return EditApplicantProfileState(
      isLoading: isLoading,
      isTop: isTop ?? this.isTop,
      error: error,
      birthday: birthday ?? this.birthday,
      isMale: isMale ?? this.isMale,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, error, isTop, isMale, birthday, avatar];
}
