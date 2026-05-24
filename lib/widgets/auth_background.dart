import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final bool isLogin; // Kita tambah parameter ini

  const AuthBackground({super.key, required this.child, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Jika login, dasar warnanya Blue. Jika signup, dasarnya Cream.
      backgroundColor: isLogin ? AppColors.brandBlue : AppColors.clouds,
      body: Stack(
        children: [
          // Lengkungan Warna Kontras
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.45,
            left: -MediaQuery.of(context).size.width * 0.5,
            right: -MediaQuery.of(context).size.width * 0.5,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                // Jika login, atasnya Cream. Jika signup, atasnya Blue.
                color: isLogin ? AppColors.clouds : AppColors.brandBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Khusus Sign Up: Ada footer biru di bawah
          if (!isLogin)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                color: AppColors.brandBlue,
              ),
            ),

          SafeArea(child: child),
        ],
      ),
    );
  }
}
