import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/artwork.dart';
import '../providers/favorites_provider.dart';

class ArtworkDetailsScreen extends StatelessWidget {
  final Artwork artwork;

  const ArtworkDetailsScreen({
    super.key,
    required this.artwork,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F2),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F6F2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFF302326),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Artwork',
          style: TextStyle(
            color: Color(0xFF302326),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Artwork image
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                artwork.imagePath,
                width: double.infinity,
                height: 420,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            // Category
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF4E5E7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                artwork.category,
                style: const TextStyle(
                  color: Color(0xFF9D5263),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 14),

            // Title
            Text(
              artwork.title,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: Color(0xFF302326),
                height: 1.1,
              ),
            ),

            const SizedBox(height: 8),

            // Artist
            Text(
              'by ${artwork.artist}',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF806F73),
              ),
            ),

            const SizedBox(height: 24),

            // About section
            const Text(
              'About this artwork',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF302326),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'A visual piece created to explore color, mood, '
              'composition and personal expression. Discover more '
              'artwork from this artist on Artfolio.',
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Color(0xFF806F73),
              ),
            ),

            const SizedBox(height: 28),

            // Favorite button
            Consumer<FavoritesProvider>(
              builder: (context, favorites, child) {
                final isFavorite = favorites.isFavorite(artwork);

                return SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      favorites.toggleFavorite(artwork);
                    },
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    label: Text(
                      isFavorite
                          ? 'Remove from Favorites'
                          : 'Add to Favorites',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B292C),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}