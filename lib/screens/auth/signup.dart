import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../widgets/auth_layouts.dart'; // Import layout yang baru dibuat
import 'login.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Rumus agar logo pas di tengah garis lengkung
    double topPadding = MediaQuery.of(context).size.height * 0.28 - 85;

    return SignupLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              SizedBox(height: topPadding > 0 ? topPadding : 20),

              // --- AVATAR / FOTO PROFIL ---
              _buildAvatarSection(),

              const SizedBox(height: 10),
              const Text(
                'Take a Photo',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 40),

              // --- FORM INPUT ---
              _buildInputField('Name'),
              const SizedBox(height: 15),
              _buildInputField('Email'),
              const SizedBox(height: 15),
              _buildInputField('Password', isPassword: true),

              const SizedBox(height: 15),

              // --- CHECKBOX ---
              _buildTermsCheckbox(),

              const SizedBox(height: 35),

              // --- TOMBOL SIGN UP ---
              _buildSignupButton(),

              const SizedBox(height: 30),

              // --- DIVIDER SOCIAL ---
              _buildSocialDivider(),

              const SizedBox(height: 25),

              // --- TOMBOL SOSIAL ---
              _buildSocialIcons(),

              const SizedBox(height: 30),

              // --- FOOTER NAVIGASI ---
              _buildFooter(context),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET HELPERS (DIPISAH AGAR RAPI) ---

  Widget _buildAvatarSection() {
    return Stack(
      alignment: Alignment.center,
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
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFF444444),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(String hint, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF7CB6D1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
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

  Widget _buildTermsCheckbox() {
    return Row(
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
    );
  }

  Widget _buildSignupButton() {
    return Container(
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
            fontFamily: 'Chango',
            fontSize: 24,
            color: AppColors.deepOcean,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialDivider() {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.deepOcean, thickness: 1.2),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Or continue with',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.deepOcean, thickness: 1.2),
        ),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['google.png', 'apple.png', 'phone.png']
          .map(
            (img) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(15),
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

  Widget _buildFooter(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ),
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
    );
  }
}
