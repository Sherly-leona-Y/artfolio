import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';
import '../widgets/artwork_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().favorites;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Favorites',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w800,
                color: Color(0xFF302326),
                height: 1,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              favorites.isEmpty
                  ? 'Save the artwork you love.'
                  : '${favorites.length} artwork${favorites.length == 1 ? '' : 's'} saved',
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF806F73),
              ),
            ),

            const SizedBox(height: 32),

            if (favorites.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 70,
                        color: Color(0xFFD7B9C0),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Nothing here yet',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF302326),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tap the heart on artwork you love.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF806F73),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              LayoutBuilder(
                builder: (context, constraints) {
                  int columns;

                  if (constraints.maxWidth < 600) {
                    columns = 2;
                  } else if (constraints.maxWidth < 1000) {
                    columns = 3;
                  } else {
                    columns = 4;
                  }

                  return GridView.builder(
                    itemCount: favorites.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {
                      final artwork = favorites[index];

                      return ArtworkCard(
                        imagePath: artwork.imagePath,
                        title: artwork.title,
                        artist: artwork.artist,
                      );
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}