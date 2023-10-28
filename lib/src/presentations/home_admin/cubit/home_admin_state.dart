part of 'home_admin_cubit.dart';

class HomeAdminState extends Equatable {
  const HomeAdminState({this.listCompany, this.error});

  final List<CompanyEntity>? listCompany;
  final String? error;

  HomeAdminState copyWith({List<CompanyEntity>? listCompany, String? error}) {
    return HomeAdminState(listCompany: listCompany, error: error);
  }

  @override
  List<Object?> get props => [listCompany, error];
}
