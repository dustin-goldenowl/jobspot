part of 'setting_cubit.dart';

class SettingState extends Equatable {
  const SettingState({required this.isNotification, required this.isVietNam});

  final bool isNotification;
  final bool isVietNam;

  SettingState copyWith({bool? isNotification, bool? isVietNam}) {
    return SettingState(
      isNotification: isNotification ?? this.isNotification,
      isVietNam: isVietNam ?? this.isVietNam,
    );
  }

  @override
  List<Object> get props => [isNotification, isVietNam];
}
