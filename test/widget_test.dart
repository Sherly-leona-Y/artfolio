import 'package:flutter_test/flutter_test.dart';

import 'package:artfolio/models/artwork.dart';
import 'package:artfolio/providers/favorites_provider.dart';

void main() {
  test('FavoritesProvider toggles favorites correctly', () {
    final provider = FavoritesProvider();

    const artwork = Artwork(
      imagePath: 'assets/images/pink1.jpg',
      title: 'Pink Dreams',
      artist: 'Maya Chen',
      category: 'Digital',
    );

    // Initially there should be no favorites.
    expect(provider.favorites, isEmpty);

    // Add artwork to favorites.
    provider.toggleFavorite(artwork);

    expect(provider.favorites.length, 1);
    expect(provider.isFavorite(artwork), true);

    // Remove artwork from favorites.
    provider.toggleFavorite(artwork);

    expect(provider.favorites, isEmpty);
    expect(provider.isFavorite(artwork), false);
  });
}