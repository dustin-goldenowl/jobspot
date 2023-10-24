part of 'update_password_cubit.dart';

class UpdatePasswordState extends Equatable {
  const UpdatePasswordState({
    required this.isLoading,
    required this.isHideConfirmPassword,
    required this.isHideNewPassword,
    required this.isHideOldPassword,
    this.error,
  });

  final bool isLoading;
  final bool isHideOldPassword;
  final bool isHideNewPassword;
  final bool isHideConfirmPassword;
  final String? error;

  factory UpdatePasswordState.ds() {
    return const UpdatePasswordState(
      isLoading: false,
      isHideConfirmPassword: true,
      isHideNewPassword: true,
      isHideOldPassword: true,
    );
  }

  UpdatePasswordState copyWith({
    bool isLoading = false,
    bool? isHideOldPassword,
    bool? isHideNewPassword,
    bool? isHideConfirmPassword,
    String? error,
  }) {
    return UpdatePasswordState(
      isLoading: isLoading,
      isHideConfirmPassword:
          isHideConfirmPassword ?? this.isHideConfirmPassword,
      isHideNewPassword: isHideNewPassword ?? this.isHideNewPassword,
      isHideOldPassword: isHideOldPassword ?? this.isHideOldPassword,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        isHideOldPassword,
        isHideNewPassword,
        isHideConfirmPassword,
        isLoading,
        error,
      ];
}
