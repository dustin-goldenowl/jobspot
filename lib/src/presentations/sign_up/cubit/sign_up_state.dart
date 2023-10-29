part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final bool isHideApplicant;
  final bool isHideRepassApplicant;
  final bool isHideBusiness;
  final bool isHideRepassBusiness;
  final bool isMale;
  final bool isLoading;
  final DateTime birthday;
  final DateTime founding;
  final DataState? dataState;
  final bool isGoogle;

  const SignUpState({
    required this.isHideApplicant,
    required this.isHideRepassApplicant,
    required this.isHideBusiness,
    required this.isHideRepassBusiness,
    required this.isMale,
    required this.isLoading,
    required this.birthday,
    required this.founding,
    required this.isGoogle,
    this.dataState,
  });

  factory SignUpState.ds() {
    return SignUpState(
      isMale: true,
      isHideApplicant: true,
      isHideRepassApplicant: true,
      isHideBusiness: true,
      isHideRepassBusiness: true,
      isLoading: false,
      isGoogle: false,
      founding: DateTime.now(),
      birthday: DateTime(
        DateTime.now().year - 18,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
  }

  SignUpState copyWith({
    bool? isHideApplicant,
    bool? isHideRepassApplicant,
    bool? isHideBusiness,
    bool? isHideRepassBusiness,
    bool? isMale,
    bool? isGoogle,
    DateTime? birthday,
    DateTime? founding,
    bool isLoading = false,
    DataState? dataState,
  }) {
    return SignUpState(
      isHideApplicant: isHideApplicant ?? this.isHideApplicant,
      isHideRepassApplicant:
          isHideRepassApplicant ?? this.isHideRepassApplicant,
      isHideBusiness: isHideBusiness ?? this.isHideApplicant,
      isHideRepassBusiness: isHideRepassBusiness ?? this.isHideRepassBusiness,
      isMale: isMale ?? this.isMale,
      isLoading: isLoading,
      isGoogle: isGoogle ?? this.isGoogle,
      birthday: birthday ?? this.birthday,
      founding: founding ?? this.founding,
      dataState: dataState,
    );
  }

  @override
  List<Object?> get props => [
        isHideApplicant,
        isHideBusiness,
        isHideRepassApplicant,
        isHideRepassBusiness,
        birthday,
        founding,
        isLoading,
        dataState,
        isMale,
      ];
}
