import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'explore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _header(context),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _hero(),
                const SizedBox(height: 25),
                const Text(
                  "Vibe Check",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                _vibeGrid(),
                const SizedBox(height: 30),
                _fundCard(),
                const SizedBox(height: 30),
                _exploreSection(context),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(context) => Stack(
    children: [
      Container(
        height: 240,
        decoration: const BoxDecoration(
          color: AppColors.brandBlue,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(200, 40),
          ),
        ),
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/logo.png', width: 30),
                ),
              ),
              const Text(
                "Hi, Christian! 👋",
                style: TextStyle(
                  fontFamily: 'Chango',
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Ready for your next adventure?",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: AppColors.deepOcean,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Where do you want to go?",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _hero() => Container(
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        image: AssetImage('assets/images/labuanbajo.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );

  Widget _vibeGrid() => GridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: 1.3,
    children: [
      _vibeItem('Healing', 'healing.webp', 'leaves (1).png'),
      _vibeItem('Adventure', 'adventure.jpg', 'bagpack.png'),
      _vibeItem('Food', 'food.jpg', 'food-tray (1).png'),
      _vibeItem('Hidden', 'hidden.jpg', 'magic-wand.png'),
    ],
  );

  Widget _vibeItem(String t, String img, String ic) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(
        image: AssetImage('assets/images/$img'),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/$ic', width: 25, color: Colors.white),
          Text(
            t,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _fundCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        colors: [Color(0xFFFFF4CC), Color(0xFFFF9966)],
      ),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How's the fund looking?",
          style: TextStyle(
            fontFamily: 'Chango',
            fontSize: 20,
            color: Color(0xFF993300),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Rp 3.5M",
            style: TextStyle(
              fontFamily: 'Climate Crisis',
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _exploreSection(context) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Explore Destination",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => const ExploreScreen()),
            ),
            child: const Text(
              "See all",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      _destCard('rajaampat.jpg'),
    ],
  );

  Widget _destCard(String img) => Container(
    height: 180,
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        image: AssetImage('assets/images/$img'),
        fit: BoxFit.cover,
      ),
    ),
  );
}
