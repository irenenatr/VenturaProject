import 'package:flutter/material.dart';
import '../utils/colors.dart';

// --- LAYOUT UNTUK LANDING
class LandingLayout extends StatelessWidget {
  final Widget child;
  const LandingLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandBlue, // Biru #ABE1E1
      body: Stack(
        children: [
          // LENGKUNGAN KREM (Dibuat landai)
          Positioned(
            // Kurva dimulai lebih atas (0.28)
            top: MediaQuery.of(context).size.height * 0.28,
            // Lebar ditarik sangat jauh ke samping agar tidak terlalu melingkar
            left: -MediaQuery.of(context).size.width * 0.8,
            right: -MediaQuery.of(context).size.width * 0.8,
            bottom: -MediaQuery.of(context).size.height * 0.5,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.clouds, // Krem #FCFAEB
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}

//SIGNUP
class SignupLayout extends StatelessWidget {
  final Widget child;
  const SignupLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.clouds, // Dasar Krem #FCFAEB
      body: Stack(
        children: [
          // LENGKUNGAN BIRU DI ATAS (Dibuat lebih OVAL)
          Container(
            height:
                MediaQuery.of(context).size.height * 0.25, // Tinggi area biru
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.brandBlue, // Biru #ABE1E1
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                  MediaQuery.of(context).size.width *
                      1.0, // Dibuat 1.0 agar lebih oval/bulat
                  140, // Kedalaman lengkungan
                ),
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}

//LOGIN
class LoginLayout extends StatelessWidget {
  final Widget child;
  const LoginLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.clouds, // Atas Krem #FCFAEB
      body: Stack(
        children: [
          // LENGKUNGAN BIRU DI BAWAH (Dinaikkan)
          Positioned(
            // Diubah dari 0.30 ke 0.25 agar lebih naik
            top: MediaQuery.of(context).size.height * 0.25,
            left: -MediaQuery.of(context).size.width * 0.5,
            right: -MediaQuery.of(context).size.width * 0.5,
            bottom: -MediaQuery.of(context).size.height * 0.2,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.brandBlue, // Biru #ABE1E1
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
