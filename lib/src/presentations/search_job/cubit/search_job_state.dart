part of 'search_job_cubit.dart';

class SearchJobState extends Equatable {
  const SearchJobState({
    required this.isTop,
    required this.isMore,
    required this.query,
    this.listJob,
    this.saveJobID,
    this.isSave,
  });

  final bool isTop;
  final bool isMore;
  final bool? isSave;
  final String query;
  final String? saveJobID;
  final List<JobEntity>? listJob;

  factory SearchJobState.ds() =>
      const SearchJobState(isTop: false, isMore: true, query: "");

  SearchJobState copyWith({
    bool? isTop,
    bool? isMore,
    List<JobEntity>? listJob,
    String? query,
    String? saveJobID,
    bool? isSave,
  }) {
    return SearchJobState(
      isTop: isTop ?? this.isTop,
      isMore: isMore ?? this.isMore,
      listJob: listJob ?? this.listJob,
      query: query ?? this.query,
      saveJobID: saveJobID,
      isSave: isSave,
    );
  }

  @override
  List<Object?> get props => [isTop, listJob, query, isMore, saveJobID, isSave];
}
