import 'package:flutter/material.dart';

import '../models/artwork.dart';
import '../widgets/artwork_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();

  String selectedCategory = 'All';

  final List<Artwork> artworks = const [
    Artwork(
      imagePath: 'assets/images/pink1.jpg',
      title: 'Pink Dreams',
      artist: 'Maya Chen',
      category: 'Digital',
    ),
    Artwork(
      imagePath: 'assets/images/pink2.jpg',
      title: 'After Midnight',
      artist: 'Aria Kim',
      category: 'Illustration',
    ),
    Artwork(
      imagePath: 'assets/images/pink3.jpg',
      title: 'Cloud Garden',
      artist: 'Lena Rose',
      category: 'Photography',
    ),
    Artwork(
      imagePath: 'assets/images/pink4.jpg',
      title: 'Glass Wings',
      artist: 'Noah Lee',
      category: '3D',
    ),
    Artwork(
      imagePath: 'assets/images/pink5.jpg',
      title: 'Retro Bloom',
      artist: 'Mia Park',
      category: 'Pixel Art',
    ),
    Artwork(
      imagePath: 'assets/images/pink6.jpg',
      title: 'Pink Horizon',
      artist: 'Sora Moon',
      category: 'Digital',
    ),
  ];

  List<Artwork> get filteredArtworks {
    final query = searchController.text.toLowerCase();

    return artworks.where((artwork) {
      final matchesSearch =
          artwork.title.toLowerCase().contains(query) ||
          artwork.artist.toLowerCase().contains(query);

      final matchesCategory =
          selectedCategory == 'All' ||
          artwork.category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const categories = [
      'All',
      'Digital',
      'Illustration',
      '3D',
      'Photography',
      'Pixel Art',
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            // Search bar
            TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search artwork or artists...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF806F73),
                ),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8DADD),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color(0xFFE8DADD),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color(0xFFB76E79),
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

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
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: _category(
                      category,
                      selectedCategory == category,
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 34),

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
                Text(
                  '${filteredArtworks.length} artworks',
                  style: const TextStyle(
                    color: Color(0xFF9D5263),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

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

                if (filteredArtworks.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 50,
                            color: Color(0xFFB79CA2),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'No artwork found',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF302326),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Try another search or category.',
                            style: TextStyle(
                              color: Color(0xFF806F73),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  itemCount: filteredArtworks.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final artwork = filteredArtworks[index];

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