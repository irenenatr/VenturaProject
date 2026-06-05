import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.clouds, // Background krem gading
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Garis vertikal di belakang kartu (Hanging Line effect)
                  Positioned(
                    top: 150,
                    left: 30,
                    bottom: 100,
                    child: Container(width: 4, color: Colors.black),
                  ),
                  Positioned(
                    top: 150,
                    right: 30,
                    bottom: 100,
                    child: Container(width: 4, color: Colors.black),
                  ),

                  Column(
                    children: [
                      const SizedBox(height: 20),
                      // Kartu 1: Our Story
                      Transform.rotate(
                        angle: 0.05, // Sedikit miring ke kanan
                        child: _buildStoryCard(
                          "Our Story",
                          "Ventura was created from a simple idea: traveling should feel exciting, not exhausting. Many travelers spend too much time switching between apps just to organize destinations, budgets, routes, and itineraries. We wanted to build a smarter and more enjoyable way to explore Indonesia.",
                          const Color(0xFFE35C5E),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Kartu 2: Our Mission (Lurus)
                      _buildStoryCard(
                        "Our Mission",
                        "Our mission is to make traveling across Indonesia more accessible, organized, and meaningful through smart technology and personalized experiences. Ventura helps travelers plan trips based on their budget, preferences, and travel style.",
                        const Color(0xFFFFDE97),
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 40),

                      // Kartu 3: Our Vision
                      Transform.rotate(
                        angle: -0.05, // Sedikit miring ke kiri
                        child: _buildStoryCard(
                          "Our Vision",
                          "We envision Ventura becoming a trusted digital travel companion that inspires more people to explore Indonesia confidently and effortlessly. By blending smart planning tools with immersive travel experiences.",
                          const Color(0xFFF78C64),
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header dengan logo dan lengkungan biru
  Widget _buildHeader(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColors.brandBlue,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(250, 50),
            ),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.deepOcean,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "ventura",
                style: TextStyle(
                  fontFamily: 'Chango',
                  fontSize: 32,
                  color: AppColors.deepOcean,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget Kartu Konten
  Widget _buildStoryCard(
    String title,
    String content,
    Color bgColor, {
    Color textColor = Colors.white,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Banner Judul di dalam kartu
          Positioned(
            top: 0,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 45, 25, 25),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: textColor,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
