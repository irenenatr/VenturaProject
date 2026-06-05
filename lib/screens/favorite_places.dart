import 'package:flutter/material.dart';
import '../utils/colors.dart';

class FavoritePlacesScreen extends StatelessWidget {
  const FavoritePlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.clouds,
      body: SingleChildScrollView(
        child: Column(children: [_header(context), _list()]),
      ),
    );
  }

  Widget _header(context) => Container(
    color: AppColors.brandBlue,
    padding: const EdgeInsets.all(20),
    child: SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/logo.png', width: 25),
              ),
            ],
          ),
          const Text(
            "Favorite Places",
            style: TextStyle(fontFamily: 'Chango', fontSize: 24),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _list() => Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        _card('Raja Ampat Sunset', 'rajaampatsunsets.jpg', 'leaves (1).png'),
        _card('Gigi Susu, Bali', 'gigisusu.jpg', 'food-tray (1).png'),
        _card('Tempo Gelato', 'tempogelato.jpg', 'food-tray (1).png'),
        _card('Sunday Market', 'sundaymarket.jpg', 'magic-wand.png'),
        _card('Pangalengan Rafting', 'pangalenganrafting.jpg', 'bagpack.png'),
        _card('Lembah Harau', 'lembahharau.jpg', 'magic-wand.png'),
        _card('Bukit Sikunir', 'bukitsikunir.jpg', 'bagpack.png'),
      ],
    ),
  );

  Widget _card(String n, String img, String ic) => Container(
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 10)],
    ),
    child: Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/images/$img',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 15,
              bottom: 15,
              child: CircleAvatar(
                backgroundColor: Colors.white30,
                child: Image.asset(
                  'assets/images/$ic',
                  width: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 15,
              bottom: 15,
              child: Image.asset('assets/images/heart (1).png', width: 25),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            n,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}
