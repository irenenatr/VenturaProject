import 'package:flutter/material.dart';
import '../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  _buildCurrentTripCard(),
                  const SizedBox(height: 25),
                  _buildSectionTitle("Vibe Check", null),
                  const SizedBox(height: 15),
                  _buildVibeGrid(),
                  const SizedBox(height: 30),
                  _buildFundTrackerCard(),
                  const SizedBox(height: 30),
                  _buildSectionTitle("Explore Destination", "See all"),
                  const SizedBox(height: 4),
                  const Text(
                    "Hidden gems & dreamy getaways await",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Menggunakan rajaampat.jpg & bali.jpg dari assets kamu
                  _buildDestinationCard('assets/images/rajaampat.jpg'),
                  const SizedBox(height: 15),
                  _buildDestinationCard('assets/images/bali.jpg'),
                  const SizedBox(height: 100), // Memberi ruang untuk FAB bawah
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- WIDGET COMPONENTS ---

  // 1. Header dengan Gelombang & Search Bar
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        // Wave Background menggunakan brandBlue #ABE1E1
        Container(
          height: 240,
          decoration: const BoxDecoration(
            color: AppColors.brandBlue,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(200, 50),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset('assets/images/logo.png', width: 35),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Hi,",
                  style: TextStyle(
                    fontFamily: 'Chango',
                    fontSize: 32,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
                const Text(
                  "Christian! 👋",
                  style: TextStyle(
                    fontFamily: 'Chango',
                    fontSize: 32,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Ready for your next adventure?",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: AppColors.deepOcean,
                  ),
                ),
                const SizedBox(height: 20),
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Where do you want to go?",
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 2. Current Trip Card (Labuan Bajo)
  Widget _buildCurrentTripCard() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/labuanbajo.jpg',
          ), // Sesuai nama file kamu
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gelap di bagian bawah gambar biar teks putih terbaca
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFFFA855A,
                    ).withOpacity(0.9), // Coral Glow
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "CURRENT TRIP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Labuan Bajo",
                  style: TextStyle(
                    fontFamily: 'Chango',
                    color: Colors.white,
                    fontSize: 32,
                    height: 1.1,
                  ),
                ),
                const Text(
                  "July 21 - July 28",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk Section Title
  Widget _buildSectionTitle(String title, String? action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: AppColors.deepOcean,
          ),
        ),
        if (action != null)
          Text(
            action,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: AppColors.bluebird,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 14,
            ),
          ),
      ],
    );
  }

  // 3. Grid Vibe Check (Menggunakan asset custom kamu)
  Widget _buildVibeGrid() {
    final List<Map<String, String>> vibes = [
      {
        'name': 'Healing',
        'img': 'assets/images/healing.webp',
        'icon': 'assets/images/leaves (1).png',
      },
      {
        'name': 'Adventure',
        'img': 'assets/images/adventure.jpg',
        'icon': 'assets/images/bagpack.png',
      },
      {
        'name': 'Food',
        'img': 'assets/images/food.jpg',
        'icon': 'assets/images/food-tray (1).png',
      },
      {
        'name': 'Hidden',
        'img': 'assets/images/hidden.jpg',
        'icon': 'assets/images/magic-wand.png',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.15,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(vibes[index]['img']!),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      vibes[index]['icon']!,
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      vibes[index]['name']!,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // 4. Fund Tracker Card (Dengan gradient & trend icon)
  Widget _buildFundTrackerCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFF4CC),
            Color(0xFFFF9966),
          ], // Kuning-Orange Gradient
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Badge Status
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.skyBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "CURRENT STATUS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "How's the\nfund looking?",
            style: TextStyle(
              fontFamily: 'Chango',
              fontSize: 24,
              color: Color(0xFF993300),
              height: 1.1,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Remaining:",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Rp 3.5M",
                  style: TextStyle(
                    fontFamily: 'Chango',
                    fontSize: 28,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Tombol On Track (Dengan trend.png)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF61C4DB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/trend.png',
                  width: 16,
                  height: 16,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                const Text(
                  "On Track",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 5. Explore Destination Card (Raja Ampat & Bali dengan Love icon custom)
  Widget _buildDestinationCard(String imgPath) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          // Tombol Hati di Pojok Kanan Bawah menggunakan heart.png / heart (1).png
          Positioned(
            right: 15,
            bottom: 15,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white24,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/heart.png', // Kosong (gunakan heart (1).png jika ingin terisi)
                width: 24,
                height: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 6. Floating Action Button Tengah (+)
  Widget _buildFAB() {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.add, color: Colors.white, size: 35),
    );
  }

  // 7. Bottom Navigation Bar Custom (Menggunakan icon custom kamu)
  Widget _buildBottomNav() {
    return BottomAppBar(
      height: 70,
      notchMargin: 10,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem('home.png', "Home", true),
          _navItem('compass.png', "Plan", false),
          const SizedBox(
            width: 40,
          ), // Spacer untuk memberikan ruang bagi FAB tengah
          _navItem('wallet (1).png', "Tracker", false),
          _navItem('user (2).png', "Profile", false),
        ],
      ),
    );
  }

  Widget _navItem(String imgName, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/$imgName',
          width: 24,
          height: 24,
          color: isActive ? Colors.black : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}
