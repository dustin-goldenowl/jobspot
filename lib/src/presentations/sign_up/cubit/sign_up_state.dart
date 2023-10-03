part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final int currentTab;
  final bool isHideApplicant;
  final bool isHideRepassApplicant;
  final bool isHideBussiness;
  final bool isHideRepassBussiness;
  final bool isMale;
  final bool isLoading;
  final DateTime birthday;
  final DateTime founding;
  final DataState? dataState;

  const SignUpState({
    required this.currentTab,
    required this.isHideApplicant,
    required this.isHideRepassApplicant,
    required this.isHideBussiness,
    required this.isHideRepassBussiness,
    required this.isMale,
    required this.isLoading,
    required this.birthday,
    required this.founding,
    this.dataState,
  });

  SignUpState copyWith({
    int? currentTab,
    bool? isHideApplicant,
    bool? isHideRepassApplicant,
    bool? isHideBussiness,
    bool? isHideRepassBussiness,
    bool? isMale,
    DateTime? birthday,
    DateTime? founding,
    bool isLoading = false,
    DataState? dataState,
  }) {
    return SignUpState(
      currentTab: currentTab ?? this.currentTab,
      isHideApplicant: isHideApplicant ?? this.isHideApplicant,
      isHideRepassApplicant:
          isHideRepassApplicant ?? this.isHideRepassApplicant,
      isHideBussiness: isHideBussiness ?? this.isHideApplicant,
      isHideRepassBussiness:
          isHideRepassBussiness ?? this.isHideRepassBussiness,
      isMale: isMale ?? this.isMale,
      isLoading: isLoading,
      birthday: birthday ?? this.birthday,
      founding: founding ?? this.founding,
      dataState: dataState,
    );
  }

  @override
  List<Object?> get props => [
        isHideApplicant,
        isHideBussiness,
        isHideRepassApplicant,
        isHideRepassBussiness,
        currentTab,
        birthday,
        founding,
        isLoading,
        dataState,
        isMale,
      ];
}
