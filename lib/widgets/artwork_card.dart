import 'package:flutter/material.dart';

class ArtworkCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String artist;

  const ArtworkCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          // Artwork image
          AspectRatio(
            aspectRatio: 0.82,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),

          // Artwork information
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
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
                        'by $artist',
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

                const Icon(
                  Icons.favorite_border,
                  size: 21,
                  color: Color(0xFF8D5A67),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}