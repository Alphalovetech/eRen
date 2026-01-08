import 'package:flutter/material.dart';
import 'dart:math' as math;

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  Widget _collage(BuildContext context, List<String> images, double size) {
    // ensure we have exactly 4 items for the 2x2 collage; fill with empty strings if needed
    final imgs = List<String>.from(images);
    while (imgs.length < 4) imgs.add('');
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: size,
        height: size,
        color: Colors.grey.shade200,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: imgs.take(4).map((path) {
            if (path.isEmpty) return Container(color: Colors.grey.shade300);
            return Image.asset(path, fit: BoxFit.cover);
          }).toList(),
        ),
      ),
    );
  }

  Widget _favCard(BuildContext context,
      {required String title,
      required String subtitle,
      required List<String> images,
      required double width}) {
    final primary = Theme.of(context).colorScheme.primary;
    // use available content width (account for padding) so collage can span full card width
    final contentWidth = (width - 24).clamp(0.0, double.infinity); // padding 12 left/right
    final collageSize = math.min(200.0, contentWidth);
    return Container(
      width: width,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _collage(context, images, collageSize),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: primary)),
                      const SizedBox(height: 6),
                      Text(subtitle, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    // sample data (replace image paths with your assets)
    final favorites = [
      {
        'title': 'House',
        'subtitle': 'Today',
        'images': [
          'assets/images/image1.jpeg',
          'assets/images/image3.jpg',
          'assets/images/image3.jpg',
          'assets/images/image1.jpeg'
        ],
      },
      {
        'title': 'Apartment',
        'subtitle': '1 week ago',
        'images': [
          'assets/images/image1.jpeg',
          'assets/images/image3.jpg',
          'assets/images/image3.jpg',
          'assets/images/image1.jpeg'
        ],
      },
      // add more groups as needed
    ];

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Location row
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 20, color: primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Location', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      SizedBox(height: 2),
                      Text('Los Angeles, California', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4)],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.notifications_none, color: primary),
                    onPressed: () {},
                    splashRadius: 20,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4)],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.chat_bubble_outline, color: primary),
                    onPressed: () {},
                    splashRadius: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Search field + filter button (compact)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search your home',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4)],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.filter_list, color: primary),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Your Favorite', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                TextButton(onPressed: () {}, child: const Text('Edit')),
              ],
            ),
            const SizedBox(height: 12),
            // Cards laid out in two columns using Wrap
            LayoutBuilder(builder: (context, constraints) {
              final gap = 12.0;
              final cardWidth = (constraints.maxWidth - gap) / 2;
              return Wrap(
                spacing: gap,
                runSpacing: 12,
                children: favorites.map((f) {
                  return _favCard(
                    context,
                    title: f['title'] as String,
                    subtitle: f['subtitle'] as String,
                    images: List<String>.from(f['images'] as List),
                    width: cardWidth,
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 80), // space for bottom nav
          ]),
        ),
      ),
    );
  }
}
