import 'package:flutter/material.dart';

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
                height: 280, // increased to avoid bottom overflow
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final prices = ['\$3500', '\$5000', '\$4200', '\$3800'];
                    final ratings = ['4.9', '4.8', '4.7', '4.6'];
                    final locations = ['Beverly Hills, CA', 'Malibu, CA', 'Beverly Hills, CA', 'Malibu, CA'];
                    final titles = ['Sunnyslade House', 'Oceanview Villa', 'Greenwood Manor', 'Lakeview Residence'];
                    return Container(
                      width: 260,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // image with badge
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                                child: Image.asset(
                                  'assets/images/image1.jpeg',
                                  width: double.infinity,
                                  height: 180, // increased to match new card height
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4)],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.campaign, size: 12, color: primary),
                                      const SizedBox(width: 6),
                                      const Text('For Sale', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.star_border, size: 20, color: Colors.grey.shade700),
                                    onPressed: () {},
                                    splashRadius: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // content
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(titles[index], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 14, color: Colors.grey),
                                    const SizedBox(width: 6),
                                    Expanded(child: Text(locations[index], style: const TextStyle(fontSize: 12, color: Colors.grey))),
                                    const SizedBox(width: 6),
                                    const Icon(Icons.my_location, size: 14, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    const Text('500 miles', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(prices[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: primary)),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        const SizedBox(width: 6),
                                        Text(ratings[index], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                  final distance = index == 0 ? '150 miles' : (index == 1 ? '150 miles' : '280 miles');
                  final titles = ['Modern Apartment', 'Cozy Cottage House', 'Urban Loft Villa'];
                  final prices = ['\$500/month', '\$800/month', '\$4500'];
                  final ratings = ['4.9', '4.8', '4.7'];
                  final tags = ['For Rent', 'For a Rent', 'For Sale'];
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
                          // image with overlapping tag
                          Stack(
                            children: [
                              Container(
                                width: 96,
                                height: 96,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.shade200),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/image3.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4)],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.campaign, size: 12, color: primary),
                                      const SizedBox(width: 6),
                                      Text(tags[index], style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          // right side: title(+fav), location, price+rating
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(titles[index], style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: Icon(Icons.star_border, color: Colors.grey.shade600),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                                    const SizedBox(width: 6),
                                    Expanded(child: Text('San Gabriel, CA · $distance', style: const TextStyle(fontSize: 12, color: Colors.grey))),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(prices[index], style: TextStyle(fontWeight: FontWeight.w800, color: primary)),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 16),
                                        const SizedBox(width: 6),
                                        Text(ratings[index], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
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