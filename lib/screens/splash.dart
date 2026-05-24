import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'auth/landing.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita pakai Scaffold agar ada dasar layarnya
    return const Scaffold(body: SplashScreenBody());
  }
}

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "WHERE YOUR NEXT STORY BEGINS",
      "subtitle":
          "Built to help you discover Indonesia with better vibes and less stress",
      "image": "assets/images/Splash1.png",
    },
    {
      "title": "PLAN LESS. FEEL MORE",
      "subtitle": "Your next unforgettable Indonesia trip starts right here ✨",
      "image": "assets/images/Splash2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Background Image
        Positioned.fill(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Image.asset(
                onboardingData[index]['image']!,
                fit: BoxFit.cover,
              );
            },
          ),
        ),

        // 2. Overlay Gradasi
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.6, 1.0],
                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
              ),
            ),
          ),
        ),

        // 3. UI Content
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- INDIKATOR (Dibuat ke tengah layar menggunakan Center) ---
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        onboardingData.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.transparent,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- JUDUL (Pake FittedBox biar otomatis ngecil & kelihatan semua) ---
                  SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit
                          .scaleDown, // Ini fungsinya biar teks ngecil kalau kepanjangan
                      alignment: Alignment.centerLeft,
                      child: Text(
                        onboardingData[_currentPage]['title']!,
                        style: const TextStyle(
                          fontFamily: 'ClimateCrisis',
                          fontSize:
                              28, // Ukuran standar, akan mengecil otomatis jika perlu
                          color: AppColors.clouds,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // --- SUBTITLE & TOMBOL ---
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          onboardingData[_currentPage]['subtitle']!,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.clouds,
                            height: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),

                      GestureDetector(
                        onTap: () {
                          if (_currentPage < onboardingData.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            // Navigasi ke LandingScreen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LandingScreen(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/Arrow.png',
                            width: 24,
                            height: 24,
                            color: AppColors.deepOcean,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
