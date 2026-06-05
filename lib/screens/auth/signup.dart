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
  bool _isAgreed = false; // State untuk checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.clouds, // Dasar bawah Krem
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HEADER: BIRU DENGAN LENGKUNGAN BAWAH ---
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.brandBlue,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(200, 60),
                    ),
                  ),
                ),
                // Avatar duduk di tengah garis
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25 - 85,
                  child: _buildAvatar(),
                ),
              ],
            ),

            // --- KONTEN FORM ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  const SizedBox(height: 120),
                  _buildInput('Name'),
                  const SizedBox(height: 15),
                  _buildInput('Email'),
                  const SizedBox(height: 15),
                  _buildInput('Password', isPass: true),
                  const SizedBox(height: 20),

                  // Checkbox Fungsional
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
                            borderRadius: BorderRadius.circular(5),
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
                  _buildBtn(context, 'Sign Up'),
                  const SizedBox(height: 25),
                  _buildDivider(),
                  const SizedBox(height: 20),
                  _socialRow(),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => const LoginScreen()),
                    ),
                    child: const Text(
                      "Already have an account? Log in",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        color: AppColors.deepOcean,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Column(
      children: [
        Container(
          height: 170,
          width: 170,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
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
        ),
        const SizedBox(height: 8),
        const Text(
          'Take a Photo',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w900,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  // Widget _buildInput, _buildBtn, _buildDivider, _socialRow sama dengan Login agar konsisten
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
          hintStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(18),
        ),
      ),
    );
  }

  Widget _buildBtn(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        if (_isAgreed)
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (c) => const MainNavigation()),
            (r) => false,
          );
      },
      child: Container(
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
              fontSize: 12,
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
