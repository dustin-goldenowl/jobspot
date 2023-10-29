part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final bool isHide;
  final bool? isLoginGoogle;
  final bool isRememberMe;
  final bool isLoading;
  final DataState? dataState;

  const SignInState({
    required this.isHide,
    required this.isRememberMe,
    this.isLoading = false,
    this.isLoginGoogle,
    this.dataState,
  });

  SignInState copyWith({
    bool? isHide,
    bool? isRememberMe,
    bool isLoading = false,
    bool? isLoginGoogle,
    DataState? dataState,
  }) {
    return SignInState(
      isHide: isHide ?? this.isHide,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      isLoading: isLoading,
      dataState: dataState,
      isLoginGoogle: isLoginGoogle,
    );
  }

  @override
  List<Object?> get props =>
      [isHide, isRememberMe, isLoading, dataState, isLoginGoogle];
}
