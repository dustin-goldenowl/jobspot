class FetchLazyData<T> {
  final List<T> listData;
  final bool isMore;
  final int limit;

  FetchLazyData({
    required this.isMore,
    required this.listData,
    required this.limit,
  });
}
