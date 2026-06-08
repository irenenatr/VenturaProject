import 'package:flutter/material.dart';
import '../utils/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controller agar isian bisa diedit
  final TextEditingController _nameController = TextEditingController(
    text: "Christian Dave",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "81234567891",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "christiandave@ventura.com",
  );

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double headerHeight = 220;
    double avatarSize = 180;

    return Scaffold(
      backgroundColor: const Color(0xFFFEF9E6), // Warna krem dasar Ventura
      body: Stack(
        children: [
          // --- LAYER 1: SEMUA KONTEN IKUT SCROLL ---
          SingleChildScrollView(
            child: Column(
              children: [
                // 1. BACKGROUND OREN OVAL (Solid 1 Warna)
                Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: headerHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.coralGlow, // Warna oren solid
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                            screenWidth * 1.5,
                            120,
                          ), // Bentuk Oval
                        ),
                      ),
                    ),

                    // 2. AVATAR (Duduk di puncak garis oval)
                    Positioned(
                      top: headerHeight - (avatarSize / 2),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: avatarSize,
                                width: avatarSize,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 15,
                                      offset: const Offset(0, 8),
                                    ),
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
                              // Ikon Pensil Edit
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
                          const SizedBox(height: 12),
                          const Text(
                            "Profile Image",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: Color(0xFF10537D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // 3. FORM INPUT (Jarak disesuaikan)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      // Jarak lebar antara "Profile Image" ke "Name" sesuai permintaan
                      const SizedBox(height: 140),

                      _buildEditableField("Name", _nameController),
                      const SizedBox(height: 25),
                      _buildEditableField(
                        "Phone Number",
                        _phoneController,
                        prefix: "+62 ",
                      ),
                      const SizedBox(height: 25),
                      _buildEditableField("Email", _emailController),

                      const SizedBox(height: 100), // Padding bawah
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- LAYER 2: TOMBOL NAVIGASI TETAP DI ATAS ---
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF0F2C54),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
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
                          color: Color(0xFF0F2C54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper Textfield
  Widget _buildEditableField(
    String label,
    TextEditingController controller, {
    String? prefix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Color(0xFF10537D),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: Color(0xFF0F2C54),
            ),
            decoration: InputDecoration(
              prefixText: prefix,
              prefixStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: Color(0xFF0F2C54),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
