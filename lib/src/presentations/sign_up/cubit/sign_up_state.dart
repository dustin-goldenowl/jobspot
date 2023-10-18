part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final int currentTab;
  final bool isHideApplicant;
  final bool isHideRepassApplicant;
  final bool isHideBusiness;
  final bool isHideRepassBusiness;
  final bool isMale;
  final bool isLoading;
  final DateTime birthday;
  final DateTime founding;
  final DataState? dataState;

  const SignUpState({
    required this.currentTab,
    required this.isHideApplicant,
    required this.isHideRepassApplicant,
    required this.isHideBusiness,
    required this.isHideRepassBusiness,
    required this.isMale,
    required this.isLoading,
    required this.birthday,
    required this.founding,
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
      founding: DateTime.now(),
      currentTab: 0,
      birthday: DateTime(
        DateTime.now().year - 18,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
  }

  SignUpState copyWith({
    int? currentTab,
    bool? isHideApplicant,
    bool? isHideRepassApplicant,
    bool? isHideBusiness,
    bool? isHideRepassBusiness,
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
      isHideBusiness: isHideBusiness ?? this.isHideApplicant,
      isHideRepassBusiness: isHideRepassBusiness ?? this.isHideRepassBusiness,
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
        isHideBusiness,
        isHideRepassApplicant,
        isHideRepassBusiness,
        currentTab,
        birthday,
        founding,
        isLoading,
        dataState,
        isMale,
      ];
}
