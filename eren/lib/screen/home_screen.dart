import 'package:flutter/material.dart';
import 'package:eren/util/house_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = ['All', 'Rent', 'Buy', 'House', 'Apartment'];
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location row
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 20),
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
                      icon: Icon(Icons.notifications_none, color: Theme.of(context).colorScheme.primary),
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
                      icon: Icon(Icons.chat_bubble_outline, color: Theme.of(context).colorScheme.primary),
                      onPressed: () {},
                      splashRadius: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Search field + filter button
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
                  // filter icon container
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4)],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.filter_list, color: Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        // TODO: open filter panel
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Category chips
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final selected = index == _selectedCategory;
                    return ChoiceChip(
                      label: Text(_categories[index]),
                      selected: selected,
                      onSelected: (_) => setState(() => _selectedCategory = index),
                      selectedColor: primary.withOpacity(0.12),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(color: selected ? primary : Colors.black87),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              // Best Offers header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Best Offers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  TextButton(onPressed: () {}, child: const Text('View All')),
                ],
              ),
              const SizedBox(height: 8),
              // Horizontal cards
              SizedBox(
                height: 230,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    // amounts go down left -> right
                    final prices = [5000, 4500, 4000, 3500];
                    final ratings = [4.9, 4.7, 4.6, 4.5];
                    final ratingCounts = [210, 180, 140, 95];
                    final distances = ['1.2 km', '1.8 km', '2.4 km', '3.0 km'];
                    return HouseCard(
                      title: index == 0 ? 'Sunnyslade House' : 'Oceanview Villa',
                      location: 'Beverly Hills, CA',
                      price: '\$${prices[index]}',
                      imageAsset: 'assets/images/image1.jpeg',
                      distance: distances[index],
                      rating: ratings[index],
                      ratingCount: ratingCounts[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              // Nearest You
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Nearest You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  TextButton(onPressed: () {}, child: const Text('View All')),
                ],
              ),
              const SizedBox(height: 8),
              // Nearest list
              Column(
                children: List.generate(3, (index) {
                  final distance = index == 0 ? '1.2 km' : '${(1.2 + index * 0.8).toStringAsFixed(1)} km';
                  final title = index == 0 ? 'Modern Apartment' : 'Cozy Studio';
                  final price = '\$${1200 + index * 400}';
                  final ratingValue = '4.${6 - index}'; // sample ratings
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          // bordered image on the left
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade200),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/image3.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // right side: name/star, location+distance, price+rating
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // name and star
                                Row(
                                  children: [
                                    Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600))),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.star, color: Colors.amber, size: 16),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                // location + distance
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                                    const SizedBox(width: 6),
                                    Text('Pasadena, CA · $distance', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                // price (left) and rating with value (right)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(price, style: TextStyle(fontWeight: FontWeight.w700, color: primary)),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        const SizedBox(width: 6),
                                        Text(ratingValue, style: const TextStyle(fontSize: 12)),
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
                }),
              ),
              const SizedBox(height: 60), // space for bottom nav
            ],
          ),
        ),
      ),
    );
  }
}