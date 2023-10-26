class SearchEntity {
  final int limit;
  final String query;
  final int? location;

  SearchEntity({required this.limit, required this.query, this.location});
}
