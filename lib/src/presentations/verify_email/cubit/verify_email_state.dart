part of 'verify_email_cubit.dart';

class VerifyEmailState extends Equatable {
  const VerifyEmailState({required this.timeResend, required this.isVerify});

  final int timeResend;
  final bool isVerify;

  VerifyEmailState copyWith({int? timeResend, bool? isVerify}) {
    return VerifyEmailState(
      timeResend: timeResend ?? this.timeResend,
      isVerify: isVerify ?? this.isVerify,
    );
  }

  @override
  List<Object> get props => [timeResend, isVerify];
}
