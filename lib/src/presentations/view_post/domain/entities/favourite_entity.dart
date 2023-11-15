class FavouriteEntity {
  final String id;
  final String uidTo;
  final List<String> listFavourite;
  final String? navigationAction;

  FavouriteEntity({
    required this.id,
    required this.uidTo,
    required this.listFavourite,
    this.navigationAction,
  });
}
