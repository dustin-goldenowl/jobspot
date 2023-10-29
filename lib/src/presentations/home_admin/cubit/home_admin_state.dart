part of 'home_admin_cubit.dart';

class HomeAdminState extends Equatable {
  const HomeAdminState({required this.isMore, this.listVerify, this.error});

  final bool isMore;
  final List<VerifyCompanyEntity>? listVerify;
  final String? error;

  HomeAdminState copyWith({
    bool? isMore,
    List<VerifyCompanyEntity>? listVerify,
    String? error,
  }) {
    return HomeAdminState(
      isMore: isMore ?? this.isMore,
      listVerify: listVerify,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isMore, listVerify, error];
}
