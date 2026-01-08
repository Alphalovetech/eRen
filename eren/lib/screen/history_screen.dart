import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  Widget _historyCard(BuildContext context, {
    required String image,
    required String title,
    required String location,
    required String distance,
    required String dateRange,
    required String persons,
    required String rooms,
    required String price,
    required String rating,
  }) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(image, width: double.infinity, height: 160, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // title + star
              Row(
                children: [
                  Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                  const SizedBox(width: 8),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                ],
              ),
              const SizedBox(height: 8),
              // location + distance
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                  const SizedBox(width: 6),
                  Expanded(child: Text(location, style: const TextStyle(fontSize: 12, color: Colors.grey))),
                  const SizedBox(width: 8),
                  const Icon(Icons.location_city, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(distance, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 10),
              // meta row (date / persons / rooms)
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                  const SizedBox(width: 6),
                  Expanded(child: Text(dateRange, style: const TextStyle(fontSize: 12, color: Colors.grey))),
                  const SizedBox(width: 8),
                  const Icon(Icons.person, size: 14, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(persons, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(width: 12),
                  const Icon(Icons.meeting_room, size: 14, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(rooms, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              // price + rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: primary)),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 6),
                      Text(rating, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    final items = [
      {
        'image': 'assets/images/image1.jpeg',
        'title': 'Modern Urban Apartment',
        'location': 'Ocean Park, CA',
        'distance': '160 miles',
        'dateRange': 'Date Check In & out: 8 - 20 Sept 2025',
        'persons': '2 Persons',
        'rooms': 'No. room: 64',
        'price': '\$2,200/month',
        'rating': '4.5',
      },
      {
        'image': 'assets/images/image3.jpg',
        'title': 'Pink Mediterranean Villa',
        'location': 'Malibu, CA',
        'distance': '210 miles',
        'dateRange': 'Date Check In & out: 1 - 10 Aug 2025',
        'persons': '3 Persons',
        'rooms': 'No. room: 4',
        'price': '\$4,800',
        'rating': '4.7',
      },
    ];

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // top: location row (small)
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 20, color: primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                    Text('Location', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(height: 2),
                    Text('Los Angeles, California', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ]),
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
            // search field
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
            // Header: back + title + edit
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                const SizedBox(width: 4),
                const Expanded(child: Text('History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                TextButton(onPressed: () {}, child: const Text('Edit')),
              ],
            ),
            const SizedBox(height: 8),
            // list of history cards
            Column(
              children: items.map((it) {
                return _historyCard(
                  context,
                  image: it['image'] as String,
                  title: it['title'] as String,
                  location: it['location'] as String,
                  distance: it['distance'] as String,
                  dateRange: it['dateRange'] as String,
                  persons: it['persons'] as String,
                  rooms: it['rooms'] as String,
                  price: it['price'] as String,
                  rating: it['rating'] as String,
                );
              }).toList(),
            ),
            const SizedBox(height: 80), // space for bottom nav
          ]),
        ),
      ),
    );
  }
}
