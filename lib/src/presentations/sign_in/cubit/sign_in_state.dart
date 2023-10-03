part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final bool isHide;
  final bool isRememberMe;
  final bool isLoading;
  final UserCredential? data;
  final String? error;

  const SignInState({
    required this.isHide,
    required this.isRememberMe,
    this.isLoading = false,
    this.data,
    this.error,
  });

  @override
  List<Object?> get props => [isHide, isRememberMe, isLoading, data, error];

  SignInState copyWith({bool? isHide, bool? isRememberMe}) {
    return SignInState(
      isHide: isHide ?? this.isHide,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      isLoading: false,
      data: null,
      error: null,
    );
  }

  SignInState loading() {
    return SignInState(
      isHide: isHide,
      isRememberMe: isRememberMe,
      isLoading: true,
      data: null,
      error: null,
    );
  }

  SignInState success(UserCredential data) {
    return SignInState(
      isHide: isHide,
      isRememberMe: isRememberMe,
      isLoading: false,
      data: data,
      error: null,
    );
  }

  SignInState failed(String error) {
    return SignInState(
      isHide: isHide,
      isRememberMe: isRememberMe,
      isLoading: false,
      data: null,
      error: error,
    );
  }
}
