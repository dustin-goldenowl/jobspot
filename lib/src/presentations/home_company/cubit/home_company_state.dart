part of 'home_company_cubit.dart';

class HomeCompanyState extends Equatable {
  const HomeCompanyState({this.jobs, required this.isMore, this.error});

  final List<MyJobEntity>? jobs;
  final bool isMore;
  final String? error;

  HomeCompanyState copyWith({
    List<MyJobEntity>? jobs,
    bool? isMore,
    String? error,
  }) {
    return HomeCompanyState(
      jobs: jobs ?? this.jobs,
      isMore: isMore ?? this.isMore,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [jobs, isMore, error];
}
