import 'package:flutter/foundation.dart';

import '../models/artwork.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Artwork> _favorites = [];

  List<Artwork> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(Artwork artwork) {
    return _favorites.any(
      (item) => item.imagePath == artwork.imagePath,
    );
  }

  void toggleFavorite(Artwork artwork) {
    if (isFavorite(artwork)) {
      _favorites.removeWhere(
        (item) => item.imagePath == artwork.imagePath,
      );
    } else {
      _favorites.add(artwork);
    }

    notifyListeners();
  }
}