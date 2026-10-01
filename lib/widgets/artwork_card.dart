import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/artwork.dart';
import '../providers/favorites_provider.dart';

class ArtworkCard extends StatelessWidget {
  final Artwork artwork;

  const ArtworkCard({
    super.key,
    required this.artwork,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/artwork-details',
          arguments: artwork,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.82,
              child: Image.asset(
                artwork.imagePath,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          artwork.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF302326),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'by ${artwork.artist}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8A777B),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Consumer<FavoritesProvider>(
                    builder: (context, favorites, child) {
                      final isFavorite = favorites.isFavorite(artwork);

                      return IconButton(
                        onPressed: () {
                          favorites.toggleFavorite(artwork);
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite
                              ? const Color(0xFFC04F70)
                              : const Color(0xFF8D5A67),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}