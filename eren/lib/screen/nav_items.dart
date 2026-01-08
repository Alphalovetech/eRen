import 'package:flutter/material.dart';

/// Public list of navigation items for reuse elsewhere.
const List<BottomNavigationBarItem> navItemsList = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite'),
  BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
  BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
  BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
];

class NavItems extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavItems({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      items: navItemsList,
    );
  }
}
