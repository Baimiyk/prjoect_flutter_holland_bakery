class FavoriteManager {
  static final Set<String> favorites = {};

  static void toggle(String title) {
    if (favorites.contains(title)) {
      favorites.remove(title);
    } else {
      favorites.add(title);
    }
  }

  static bool isFavorite(String title) {
    return favorites.contains(title);
  }
}