import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/auth_layouts.dart';
import 'signup.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            // 1. Jarak atas disesuaikan agar logo pas di puncak kurva
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),

            // 2. Maskot Logo
            Image.asset('assets/images/logo.png', height: 320),

            // 3. Jarak logo ke teks dibuat rapat
            const SizedBox(height: 10),

            const Text(
              'ventura',
              style: TextStyle(
                fontFamily: 'Chango',
                fontSize: 54,
                color: AppColors.deepOcean,
                letterSpacing: -2.0, // Dibuat lebih rapat
                height: 1.0,
              ),
            ),

            // 4. Jarak ke grup tombol (diperpendek agar footer naik)
            const SizedBox(height: 60),

            // 5. Tombol Sosial
            _buildSocialBtn('Continue with Google', 'google.png'),
            const SizedBox(height: 14),
            _buildSocialBtn('Continue with Apple', 'apple.png'),
            const SizedBox(height: 14),
            _buildSocialBtn('Continue with Phone', 'phone.png'),

            const Spacer(), // Dorong sedikit tapi tidak terlalu jauh
            // 6. Footer (Diperkecil dan didekatkan)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't have an account? ",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      color: AppColors.deepOcean,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialBtn(String text, String icon) {
    return Container(
      width: double.infinity,
      height: 52, // Tinggi tombol dibuat lebih ramping seperti desain
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Image.asset('assets/images/$icon', width: 22),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800, // Bold tebal
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 22),
          ],
        ),
      ),
    );
  }
}
