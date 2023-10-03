part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final bool isHide;
  final bool isRememberMe;
  final bool isLoading;
  final DataState? dataState;

  const SignInState({
    required this.isHide,
    required this.isRememberMe,
    this.isLoading = false,
    this.dataState,
  });

  @override
  List<Object?> get props => [isHide, isRememberMe, isLoading, dataState];

  SignInState copyWith({
    bool? isHide,
    bool? isRememberMe,
    bool isLoading = false,
    DataState? dataState,
  }) {
    return SignInState(
      isHide: isHide ?? this.isHide,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      isLoading: isLoading,
      dataState: dataState,
    );
  }
}
