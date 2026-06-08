import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brandBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.deepOcean,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reset\nPassword',
              style: TextStyle(
                fontFamily: 'Chango',
                fontSize: 40,
                color: AppColors.deepOcean,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Don't worry! Enter your email and we'll send you a link to reset your password.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.deepOcean,
              ),
            ),
            const SizedBox(height: 40),

            // Input Email
            Container(
              decoration: BoxDecoration(
                color: AppColors.bluebird,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'Poppins',
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Send
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: const Center(
                child: Text(
                  'Send Link',
                  style: TextStyle(
                    fontFamily: 'Chango',
                    fontSize: 20,
                    color: AppColors.deepOcean,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
