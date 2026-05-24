import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/auth_layouts.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // RUMUS: (Tinggi Garis Kurva) - (Setengah Tinggi Logo)
    // 0.25 adalah posisi top di LandingLoginLayout
    // 135 adalah setengah dari 270
    double logoTopSpacing = (MediaQuery.of(context).size.height * 0.25) - 135;

    return LoginLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Logo Maskot di Puncak
              // Jika hasilnya negatif (di HP layar pendek), kita beri batas minimal 10
              SizedBox(height: logoTopSpacing > 0 ? logoTopSpacing : 10),

              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 270, // Ukuran logo yang kamu minta
                  fit: BoxFit.contain,
                ),
              ),

              // Jarak ke teks "Hello" diperkecil agar pas
              const SizedBox(height: 15),

              const Text(
                'Hello',
                style: TextStyle(
                  fontFamily: 'Chango',
                  fontSize: 56,
                  color: AppColors.deepOcean,
                  height: 1.0,
                ),
              ),
              const Text(
                "We're glad you came back!",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: AppColors.deepOcean,
                ),
              ),

              const SizedBox(height: 40),

              // 3. Input Fields (Spasi dirapatkan)
              _buildInput('Enter Email'),
              const SizedBox(height: 16),
              _buildInput('Password', isPass: true),

              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot your password? Click here',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepOcean,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // 4. Tombol Log in
              _buildActionBtn('Log in'),

              const SizedBox(height: 35),

              // 5. Divider
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppColors.deepOcean, thickness: 1.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Or continue with',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppColors.deepOcean, thickness: 1.2),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 6. Social Icons
              _socialRow(),

              const SizedBox(height: 30),

              // 7. Footer
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.deepOcean,
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(text: "Not a member? "),
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPERS (Masih sama dengan sebelumnya) ---
  Widget _buildInput(String hint, {bool isPass = false}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bluebird,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        obscureText: isPass,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white70,
            fontFamily: 'Poppins',
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildActionBtn(String label) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Chango',
            fontSize: 24,
            color: AppColors.deepOcean,
          ),
        ),
      ),
    );
  }

  Widget _socialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['google.png', 'apple.png', 'phone.png']
          .map(
            (img) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/$img', width: 28),
            ),
          )
          .toList(),
    );
  }
}
