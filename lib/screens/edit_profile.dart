import 'package:flutter/material.dart';
import '../utils/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double headerHeight = 220;
    double avatarSize = 180;

    return Scaffold(
      backgroundColor: AppColors.clouds,
      body: Stack(
        children: [
          // 1. Background Oval Orange
          Container(
            height: headerHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.coralGlow,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(250, 60),
              ),
            ),
          ),

          // 2. Navigasi Atas
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context), // Back ke Profile
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.deepOcean,
                        size: 24,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        color: AppColors.deepOcean,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. Konten (Avatar di Puncak)
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: headerHeight - (avatarSize / 2)),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: avatarSize,
                      width: avatarSize,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 15),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE6E6E6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Profile Image",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Color(0xFF10537D),
                  ),
                ),
                const SizedBox(height: 40),
                _buildField("Name", "Christian Dave"),
                _buildField("Phone Number", "81234567891", prefix: "+62 "),
                _buildField("Email", "christiandave@ventura.com"),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, String value, {String? prefix}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Color(0xFF10537D),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                if (prefix != null)
                  Text(
                    prefix,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                      color: AppColors.deepOcean,
                    ),
                  ),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: AppColors.deepOcean,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
