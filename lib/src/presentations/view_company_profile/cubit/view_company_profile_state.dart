part of 'view_company_profile_cubit.dart';

class ViewCompanyProfileState extends Equatable {
  const ViewCompanyProfileState({required this.isTop, this.listJob});

  final bool isTop;
  final List<JobEntity>? listJob;

  ViewCompanyProfileState copyWith({bool? isTop, List<JobEntity>? listJob}) {
    return ViewCompanyProfileState(
      isTop: isTop ?? this.isTop,
      listJob: listJob ?? this.listJob,
    );
  }

  @override
  List<Object?> get props => [isTop, listJob];
}
