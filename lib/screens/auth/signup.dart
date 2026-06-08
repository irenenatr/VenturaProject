import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../main_navigation.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // State untuk menangani checklist
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    // Perhitungan agar logo pas di tengah garis lengkung
    // (Tinggi area biru 28% dari layar - setengah tinggi avatar)
    double topPadding = (MediaQuery.of(context).size.height * 0.28) - 85;

    return Scaffold(
      backgroundColor: AppColors.clouds, // Dasar bawah Krem #FCFAEB
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER: LENGKUNGAN BIRU DI ATAS ---
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.brandBlue, // Biru #ABE1E1
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(250, 140), // Bentuk Oval
                    ),
                  ),
                ),
                // --- AVATAR / FOTO PROFIL ---
                Positioned(
                  top: topPadding > 0 ? topPadding : 20,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 170,
                            width: 170,
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
                              padding: const EdgeInsets.all(25),
                              child: Image.asset(
                                'assets/images/logo.png', // Ganti dengan asset maskotmu
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          // Icon Kamera Edit
                          Container(
                            margin: const EdgeInsets.all(5),
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
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Take a Photo',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // --- FORM INPUT & TOMBOL ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ), // Ruang agar tidak menabrak Avatar

                  _buildInput('Name'),
                  const SizedBox(height: 15),
                  _buildInput('Email'),
                  const SizedBox(height: 15),
                  _buildInput('Password', isPass: true),

                  const SizedBox(height: 15),

                  // --- CHECKBOX TERMS ---
                  GestureDetector(
                    onTap: () => setState(() => _isAgreed = !_isAgreed),
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: _isAgreed
                                ? AppColors.brandBlue
                                : Colors.white,
                            border: Border.all(
                              color: AppColors.deepOcean,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: _isAgreed
                              ? const Icon(
                                  Icons.check,
                                  size: 14,
                                  color: AppColors.deepOcean,
                                )
                              : null,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Agree with Terms & Condition',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // --- TOMBOL SIGN UP ---
                  _buildSignupBtn(context),

                  const SizedBox(height: 25),

                  // --- FOOTER NAVIGASI ---
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => const LoginScreen()),
                    ),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 12,
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
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Input Field berwarna Biru Teal
  Widget _buildInput(String hint, {bool isPass = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF7CB6D1), // Biru Teal sesuai gambar
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
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

  // Widget Helper untuk Tombol Sign Up Putih
  Widget _buildSignupBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isAgreed) {
          // Pindah ke halaman utama
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (c) => const MainNavigation()),
            (route) => false,
          );
        } else {
          // Alert jika belum centang
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please agree to the Terms & Conditions"),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: 'Chango', // Pakai font tebal sesuai gambar
              fontSize: 26,
              color: AppColors.deepOcean,
            ),
          ),
        ),
      ),
    );
  }
}
