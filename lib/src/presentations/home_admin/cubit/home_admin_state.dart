part of 'home_admin_cubit.dart';

class HomeAdminState extends Equatable {
  const HomeAdminState({required this.isMore, this.listCompany, this.error});

  final bool isMore;
  final List<CompanyEntity>? listCompany;
  final String? error;

  HomeAdminState copyWith({
    bool? isMore,
    List<CompanyEntity>? listCompany,
    String? error,
  }) {
    return HomeAdminState(
      isMore: isMore ?? this.isMore,
      listCompany: listCompany,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isMore, listCompany, error];
}
