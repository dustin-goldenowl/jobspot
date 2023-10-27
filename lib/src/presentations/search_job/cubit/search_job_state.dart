part of 'search_job_cubit.dart';

class SearchJobState extends Equatable {
  const SearchJobState({
    required this.isTop,
    required this.isMore,
    this.listJob,
    required this.query,
  });

  final bool isTop;
  final bool isMore;
  final String query;
  final List<JobEntity>? listJob;

  factory SearchJobState.ds() {
    return const SearchJobState(isTop: false, isMore: true, query: "");
  }

  SearchJobState copyWith({
    bool? isTop,
    bool? isMore,
    List<JobEntity>? listJob,
    String? query,
  }) {
    return SearchJobState(
      isTop: isTop ?? this.isTop,
      isMore: isMore ?? this.isMore,
      listJob: listJob,
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [isTop, listJob, query, isMore];
}
