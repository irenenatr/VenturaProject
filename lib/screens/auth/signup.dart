import 'package:flutter/material.dart';
import 'package:p_ventura/screens/home.dart';
import '../../utils/colors.dart';
import '../../widgets/auth_layouts.dart';
import 'login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Perhitungan agar lingkaran putih pas memotong garis oval
    double topPadding = MediaQuery.of(context).size.height * 0.25 - 80;

    return SignupLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              SizedBox(height: topPadding > 0 ? topPadding : 20),

              // --- AVATAR SECTION (Lingkaran Putih & Logo DIKECILKAN) ---
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height:
                        155, // Ukuran lingkaran putih dikecilkan (sebelumnya 190)
                    width: 155,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        18,
                      ), // Padding ditambah agar logo di dalam mengecil
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF444444),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Take a Photo',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 35), // Spasi konten yang lebih lega
              // --- INPUT FIELDS ---
              _buildInput('Name'),
              const SizedBox(height: 15),
              _buildInput('Email'),
              const SizedBox(height: 15),
              _buildInput('Password', isPass: true),

              const SizedBox(height: 15),

              // --- CHECKBOX ---
              Row(
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.deepOcean, width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Agree with Terms & Condition',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // --- TOMBOL SIGN UP ---
              _buildActionBtn('Sign Up'),

              const SizedBox(height: 30),

              // --- DIVIDER ---
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppColors.deepOcean, thickness: 1.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppColors.deepOcean, thickness: 1.2),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              _socialIcons(),

              const SizedBox(height: 30),

              // --- FOOTER ---
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) =>
                        false, // Menghapus history agar tidak bisa back ke login
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 13,
                    ),
                    children: [
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: AppColors.deepOcean,
                        ),
                      ),
                    ],
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

  // --- HELPERS ---
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
            fontWeight: FontWeight.w500,
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

  Widget _socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['google.png', 'apple.png', 'phone.png']
          .map(
            (img) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Image.asset('assets/images/$img', width: 26),
            ),
          )
          .toList(),
    );
  }
}
