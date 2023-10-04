part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({this.isLoading = false, this.dataState});

  final bool isLoading;
  final DataState? dataState;

  ForgotPasswordState copyWith({
    bool isLoading = false,
    DataState? dataState,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading,
      dataState: dataState ?? this.dataState,
    );
  }

  @override
  List<Object?> get props => [isLoading, dataState];
}
