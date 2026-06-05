import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'home.dart';
import 'profile.dart';
import 'explore.dart'; // Tetap diimport jika ingin tab 'Plan' langsung ke sini

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // List halaman untuk Tab
  final List<Widget> _pages = [
    const HomeScreen(),
    const ExploreScreen(), // Tab Plan diarahkan ke Explore
    const Center(child: Text("Tracker Page Placeholder")),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.clouds,
      body: IndexedStack(index: _currentIndex, children: _pages),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 75,
        notchMargin: 12,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem('home.png', 'Home', 0),
            _navItem('compass.png', 'Plan', 1),
            const SizedBox(width: 40), // Ruang FAB
            _navItem('wallet (1).png', 'Tracker', 2),
            _navItem('user (2).png', 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String img, String label, int index) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/$img',
            width: 22,
            color: isActive ? Colors.black : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
