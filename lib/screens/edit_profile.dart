import 'package:flutter/material.dart';
import '../utils/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.clouds,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            const SizedBox(height: 20),
            _avatar(),
            const SizedBox(height: 40),
            _field("Name", "Christian Dave"),
            _field("Phone", "+62 81234567891"),
            _field("Email", "dave@mail.com"),
          ],
        ),
      ),
    );
  }

  Widget _header(context) => Container(
    height: 200,
    decoration: const BoxDecoration(
      color: AppColors.coralGlow,
      borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(250, 50)),
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Save")),
          ],
        ),
      ),
    ),
  );

  Widget _avatar() => Column(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.edit, size: 20, color: Colors.white),
          ),
        ],
      ),
      const Text(
        "Profile Image",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ],
  );

  Widget _field(String l, String v) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Text(v),
        ),
      ],
    ),
  );
}
