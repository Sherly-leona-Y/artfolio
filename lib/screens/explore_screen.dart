import 'package:flutter/material.dart';
import '../widgets/artwork_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────────────────────────────
            // HEADER
            // ─────────────────────────────────────

            const Text(
              'Explore',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w800,
                color: Color(0xFF302326),
                height: 1,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Find something that speaks to you.',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF806F73),
              ),
            ),

            const SizedBox(height: 28),

            // ─────────────────────────────────────
            // SEARCH BAR
            // ─────────────────────────────────────

            Container(
              height: 56,
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
                    size: 22,
                    color: Color(0xFF806F73),
                  ),

                  SizedBox(width: 12),

                  Text(
                    'Search artwork or artists...',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9A898D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ─────────────────────────────────────
            // CATEGORY FILTERS
            // ─────────────────────────────────────

            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF302326),
              ),
            ),

            const SizedBox(height: 14),

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
                  _category('Pixel Art', false),
                ],
              ),
            ),

            const SizedBox(height: 34),

            // ─────────────────────────────────────
            // TRENDING HEADER
            // ─────────────────────────────────────

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF302326),
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xFF9D5263),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            // ─────────────────────────────────────
            // RESPONSIVE ARTWORK GRID
            // ─────────────────────────────────────

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

                return GridView.count(
                  crossAxisCount: columns,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 20,
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // CATEGORY CHIP
  // ─────────────────────────────────────────────

  Widget _category(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 19),
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
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}