import 'package:flutter/material.dart';
import '../widgets/artwork_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w800,
                color: Color(0xFF302326),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Find something that speaks to you.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF806F73),
              ),
            ),

            const SizedBox(height: 26),

            // Search bar
            Container(
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFFE8DADD),
                ),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 18),
                  Icon(
                    Icons.search,
                    color: Color(0xFF806F73),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Search artwork or artists...',
                    style: TextStyle(
                      color: Color(0xFF9A898D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // Categories
            SizedBox(
              height: 42,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _category('All', true),
                  _category('Digital', false),
                  _category('Illustration', false),
                  _category('3D', false),
                  _category('Photography', false),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Trending',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF302326),
              ),
            ),

            const SizedBox(height: 18),

            // Artwork grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 18,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.68,
              children: const [
                ArtworkCard(
                  imagePath: 'assets/images/pink1.jpg',
                  title: 'Pink Dreams',
                  artist: 'Maya Chen',
                ),
                ArtworkCard(
                  imagePath: 'assets/images/pink2.jpg',
                  title: 'After Midnight',
                  artist: 'Aria Kim',
                ),
                ArtworkCard(
                  imagePath: 'assets/images/pink3.jpg',
                  title: 'Cloud Garden',
                  artist: 'Lena Rose',
                ),
                ArtworkCard(
                  imagePath: 'assets/images/pink4.jpg',
                  title: 'Glass Wings',
                  artist: 'Noah Lee',
                ),
                ArtworkCard(
                  imagePath: 'assets/images/pink5.jpg',
                  title: 'Retro Bloom',
                  artist: 'Mia Park',
                ),
                ArtworkCard(
                  imagePath: 'assets/images/pink6.jpg',
                  title: 'Pink Horizon',
                  artist: 'Sora Moon',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _category(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFF3B292C)
            : const Color(0xFFF4E5E7),
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: selected
              ? Colors.white
              : const Color(0xFF6E555A),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}