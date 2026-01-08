import 'package:flutter/material.dart';

class HouseCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String? imageAsset;
  final double width;
  final VoidCallback? onTap;
  final String? distance; // e.g. '2.4 km'
  final double? rating; // e.g. 4.8
  final int? ratingCount; // e.g. 120

  const HouseCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    this.imageAsset,
    this.width = 250,
    this.onTap,
    this.distance,
    this.rating,
    this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image area
            Container(
              height: 110,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                image: imageAsset != null
                    ? DecorationImage(image: AssetImage(imageAsset!), fit: BoxFit.cover)
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title with star to the right
                  Row(
                    children: [
                      Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600))),
                      if (rating != null) ...[
                        const SizedBox(width: 6),
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(rating!.toStringAsFixed(1), style: const TextStyle(fontSize: 12)),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  // location + distance on its own row
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          distance != null ? '$location · $distance' : location,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // separate row for price and ratingCount (star)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: TextStyle(fontWeight: FontWeight.w700, color: primary)),
                      if (ratingCount != null)
                        Row(
                          children: [
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(ratingCount.toString(), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                    ],
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
