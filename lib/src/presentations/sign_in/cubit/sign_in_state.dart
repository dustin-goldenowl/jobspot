part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final bool isHide;
  final bool? isRegisterGoogle;
  final bool isRememberMe;
  final bool isLoading;
  final DataState? dataState;

  const SignInState({
    required this.isHide,
    required this.isRememberMe,
    this.isLoading = false,
    this.isRegisterGoogle,
    this.dataState,
  });

  SignInState copyWith({
    bool? isHide,
    bool? isRememberMe,
    bool isLoading = false,
    bool? isRegisterGoogle,
    DataState? dataState,
  }) {
    return SignInState(
      isHide: isHide ?? this.isHide,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      isLoading: isLoading,
      dataState: dataState,
      isRegisterGoogle: isRegisterGoogle,
    );
  }

  @override
  List<Object?> get props =>
      [isHide, isRememberMe, isLoading, dataState, isRegisterGoogle];
}
