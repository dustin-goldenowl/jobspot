part of 'register_google_cubit.dart';

class RegisterGoogleState extends Equatable {
  const RegisterGoogleState({
    required this.birthday,
    this.dataState,
    required this.isLoading,
    required this.isMale,
  });

  final bool isMale;
  final bool isLoading;
  final DateTime birthday;
  final DataState? dataState;

  factory RegisterGoogleState.ds() {
    return RegisterGoogleState(
      birthday: DateTime(
        DateTime.now().year - 18,
        DateTime.now().month,
        DateTime.now().day,
      ),
      isLoading: false,
      isMale: true,
    );
  }

  RegisterGoogleState copyWith({
    bool? isMale,
    bool? isLoading,
    DateTime? birthday,
    DataState? dataState,
  }) {
    return RegisterGoogleState(
      birthday: birthday ?? this.birthday,
      isLoading: isLoading ?? this.isLoading,
      isMale: isMale ?? this.isMale,
      dataState: dataState,
    );
  }

  @override
  List<Object?> get props => [birthday, dataState, isLoading, isMale];
}
