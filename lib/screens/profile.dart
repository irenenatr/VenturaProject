import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../widgets/logout.dart'; // Import widget popup yang kita buat
import 'edit_profile.dart';
import 'favorite_places.dart';
import 'about_app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Fungsi untuk menampilkan Popup Logout dengan Blur
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const LogoutDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // 1. KARTU PROFIL (Navigasi ke Edit Profile via Pensil)
                _buildProfileCard(context),

                const SizedBox(height: 30),

                // 2. GRID KARTU (Favorite & About)
                Row(
                  children: [
                    // Kartu Favorite Places
                    Expanded(
                      child: _buildGridCard(
                        title: "Favorite Places",
                        value: "7",
                        isNumber: true,
                        colors: [
                          const Color(0xFFFA855A),
                          const Color(0xFFCA3537),
                        ],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FavoritePlacesScreen(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Kartu About App
                    Expanded(
                      child: _buildGridCard(
                        title: "About App",
                        value: "sparkles",
                        isNumber: false,
                        colors: [
                          const Color(0xFFFFF8D0),
                          const Color(0xFFFA855A),
                        ],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutAppScreen(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // 3. TOMBOL LOGOUT (Memicu Popup Blur)
                GestureDetector(
                  onTap: () => _showLogoutDialog(context),
                  child: _buildLogoutButton(),
                ),

                const SizedBox(height: 120), // Agar tidak tertutup Navbar bawah
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColors.brandBlue,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(200, 40),
            ),
          ),
        ),
        const SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontFamily: 'Chango',
                  fontSize: 26,
                  color: AppColors.deepOcean,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFFEF9E6),
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/images/logo.png', width: 70, height: 70),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Christian Dave",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                    color: AppColors.deepOcean,
                  ),
                ),
                Text(
                  "christiandave@ventura.com",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    color: Color(0xFF10537D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "+6281234567891",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Color(0xFF10537D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black, size: 22),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfileScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridCard({
    required String title,
    required String value,
    required bool isNumber,
    required List<Color> colors,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isNumber)
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'Climate Crisis',
                fontSize: 45,
                color: Colors.white,
              ),
            )
          else
            const Icon(Icons.auto_awesome, color: Colors.white, size: 45),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              "See all",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.logout_rounded, color: Colors.black),
          SizedBox(width: 10),
          Text(
            "Log out",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
