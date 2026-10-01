import 'package:flutter/material.dart';
import '../services/quote_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final QuoteService quoteService = QuoteService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ARTFOLIO',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3,
                  ),
                ),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2D2D8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Color(0xFF3B292C),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 45),

            const Text(
              'Discover',
              style: TextStyle(
                fontSize: 48,
                height: 1,
                fontWeight: FontWeight.w300,
                color: Color(0xFF302326),
              ),
            ),

            const Text(
              'the art you feel.',
              style: TextStyle(
                fontSize: 48,
                height: 1.05,
                fontWeight: FontWeight.w800,
                color: Color(0xFF302326),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'A little corner of the internet for beautiful things.',
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Color(0xFF756568),
              ),
            ),

            const SizedBox(height: 30),

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
                    'Search artwork, artists...',
                    style: TextStyle(
                      color: Color(0xFF9A898D),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 38),

            // Featured heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 24,
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
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Featured artwork
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF2A6B9),
                    Color(0xFFD46A8A),
                    Color(0xFF6D394B),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 24,
                    left: 24,
                    child: Text(
                      'FEATURED ART',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 24,
                    bottom: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dreams in Pink',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'by Maya Chen',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 20,
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // API section
            const SizedBox(height: 38),

            const Text(
              'A little inspiration',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF302326),
              ),
            ),

            const SizedBox(height: 14),

            FutureBuilder<String>(
              future: quoteService.fetchQuote(),
              builder: (context, snapshot) {
                // Loading state
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    width: double.infinity,
                    height: 110,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4E5E7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFC04F70),
                      ),
                    ),
                  );
                }

                // Error state
                if (snapshot.hasError) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4E5E7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Could not load inspiration. Please try again later.',
                      style: TextStyle(
                        color: Color(0xFF806F73),
                        fontSize: 14,
                      ),
                    ),
                  );
                }

                // Success state
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B292C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '"${snapshot.data}"',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 38),

            // Explore by mood
            const Text(
              'Explore by mood',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF302326),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryChip('Dreamy', true),
                  _categoryChip('Minimal', false),
                  _categoryChip('Retro', false),
                  _categoryChip('Bold', false),
                  _categoryChip('Nature', false),
                ],
              ),
            ),

            const SizedBox(height: 38),

            // Trending artists
            const Text(
              'Trending artists',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF302326),
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                _artistAvatar('M', 'Maya'),
                const SizedBox(width: 24),
                _artistAvatar('A', 'Aria'),
                const SizedBox(width: 24),
                _artistAvatar('L', 'Lena'),
                const SizedBox(width: 24),
                _artistAvatar('N', 'Noah'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryChip(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          color: selected ? Colors.white : const Color(0xFF6E555A),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _artistAvatar(String letter, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFFF2C9D1),
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF6D394B),
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          name,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF5E4D51),
          ),
        ),
      ],
    );
  }
}