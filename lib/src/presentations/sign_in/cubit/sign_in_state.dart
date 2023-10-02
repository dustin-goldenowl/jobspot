part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState extends Equatable {}

final class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

final class SignInLoadingState extends SignInState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

final class SignInSuccessState extends SignInState {
  final UserCredential userCredential;

  SignInSuccessState(this.userCredential);

  @override
  List<Object?> get props => [userCredential];
}

final class SignInErrorState extends SignInState {
  final String error;

  SignInErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

final class HidePasswordState extends SignInState {
  final bool isHide;

  HidePasswordState(this.isHide);

  @override
  List<Object?> get props => [isHide];
}

final class RememberMeState extends SignInState {
  final bool isRememberMe;

  RememberMeState(this.isRememberMe);

  @override
  List<Object?> get props => [isRememberMe];
}
