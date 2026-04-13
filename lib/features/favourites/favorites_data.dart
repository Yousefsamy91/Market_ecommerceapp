class FavoritesData {
  static List<Map<String, dynamic>> favorites = [];

  static void toggleFavorite(Map<String, dynamic> product) {
    final exists =
    favorites.any((item) => item["id"] == product["id"]);

    if (exists) {
      favorites.removeWhere((item) => item["id"] == product["id"]);
    } else {
      favorites.add(product);
    }
  }

  static bool isFavorite(Map<String, dynamic> product) {
    return favorites.any((item) => item["id"] == product["id"]);
  }
}