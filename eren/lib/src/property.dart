class Property {
  final String id;
  final String title;
  final String location;
  final String imageUrl;
  final String price;
  final double rating;
  final bool featured;
  Property({
    required this.id,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.rating,
    this.featured = false,
  });
  factory Property.fromMap(String id, Map<String, dynamic> m) => Property(
    id: id,
    title: m['title'] ?? '',
    location: m['location'] ?? '',
    imageUrl: m['imageUrl'] ?? '',
    price: m['price'] ?? '',
    rating: (m['rating'] ?? 0).toDouble(),
    featured: m['featured'] ?? false,
  );
}