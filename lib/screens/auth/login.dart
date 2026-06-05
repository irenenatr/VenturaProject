import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../main_navigation.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran layar untuk kalkulasi proporsi
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Tinggi Lengkungan Background (25% dari layar)
    final double headerHeight = screenHeight * 0.25;
    // Setengah dari tinggi logo (270 / 2 = 135)
    final double logoOffset = 135;

    return Scaffold(
      // Warna dasar bawah adalah Biru #ABE1E1
      backgroundColor: AppColors.brandBlue,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1. AREA KREM DI ATAS (HEADER)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: headerHeight,
                decoration: const BoxDecoration(
                  color: AppColors.clouds, // Krem
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(250, 80),
                  ),
                ),
              ),
            ),

            // 2. KONTEN UTAMA (Satu Halaman, Tanpa Scroll)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  // Jarak dari atas ke titik logo di puncak
                  SizedBox(height: headerHeight - logoOffset),

                  // LOGO (Tinggi 270)
                  Image.asset(
                    'assets/images/logo.png',
                    height: 270,
                    fit: BoxFit.contain,
                  ),

                  // Gunakan Expanded atau Spacer agar konten sisa muat di bawah logo
                  Expanded(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Pusatkan secara vertikal
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello',
                          style: TextStyle(
                            fontFamily: 'Chango',
                            fontSize:
                                48, // Sedikit dikecilkan agar aman di layar kecil
                            color: AppColors.deepOcean,
                            height: 1.0,
                          ),
                        ),
                        const Text(
                          "We're glad you came back!",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                            color: AppColors.deepOcean,
                          ),
                        ),

                        SizedBox(
                          height: screenHeight * 0.03,
                        ), // Jarak responsif

                        _buildInput('Enter Email'),
                        const SizedBox(height: 12),
                        _buildInput('Password', isPass: true),

                        const SizedBox(height: 8),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot your password? Click here',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: AppColors.deepOcean,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        _buildBtn(context, 'Log in'),

                        SizedBox(height: screenHeight * 0.03),

                        _buildDivider(),

                        const SizedBox(height: 15),
                        _socialRow(),

                        const Spacer(), // Dorong footer ke paling bawah

                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => const SignupScreen(),
                              ),
                            ),
                            child: const Text(
                              "Not a member? Sign Up",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w900,
                                color: AppColors.deepOcean,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20), // Padding bawah
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPERS ---
  Widget _buildInput(String hint, {bool isPass = false}) {
    return Container(
      height: 50, // Tinggi input dikunci agar hemat ruang
      decoration: BoxDecoration(
        color: AppColors.bluebird,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        obscureText: isPass,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white70,
            fontFamily: 'Poppins',
            fontSize: 13,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildBtn(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (c) => const MainNavigation()),
          (r) => false,
        );
      },
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Chango',
              fontSize: 22,
              color: AppColors.deepOcean,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.deepOcean, thickness: 1),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or continue with",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.deepOcean, thickness: 1),
        ),
      ],
    );
  }

  Widget _socialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['google.png', 'apple.png', 'phone.png']
          .map(
            (img) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/$img', width: 22),
            ),
          )
          .toList(),
    );
  }
}
