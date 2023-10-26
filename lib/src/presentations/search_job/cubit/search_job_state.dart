part of 'search_job_cubit.dart';

class SearchJobState extends Equatable {
  const SearchJobState({required this.isTop, this.listJob});

  final bool isTop;
  final List<JobEntity>? listJob;

  SearchJobState copyWith({bool? isTop, List<JobEntity>? listJob}) {
    return SearchJobState(
      isTop: isTop ?? this.isTop,
      listJob: listJob ?? this.listJob,
    );
  }

  @override
  List<Object?> get props => [isTop, listJob];
}
