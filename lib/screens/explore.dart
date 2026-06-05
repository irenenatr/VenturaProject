import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(context),
            _section("Popular Destination", _popularList()),
            _section("Recommended for You", _recommended()),
            _section("Recently Viewed", _recent()),
          ],
        ),
      ),
    );
  }

  Widget _header(context) => Container(
    color: const Color(0xFFC7E3EA),
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
            "Explore Destination",
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

  Widget _section(String t, Widget c) => Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 15),
        c,
      ],
    ),
  );

  Widget _popularList() => SizedBox(
    height: 220,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _popItem('Thousand Island', 'pulauseribu.jpg'),
        _popItem('Malioboro', 'malioboro.jpg'),
        _popItem('Gili Island', 'gili.jpg'),
      ],
    ),
  );

  Widget _popItem(String n, String img) => Container(
    width: 140,
    margin: const EdgeInsets.only(right: 15),
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            'assets/images/$img',
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          n,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    ),
  );

  Widget _recommended() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            'assets/images/sumba.webp',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 15),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sumba, East NTT",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Nature and culture mix.",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _recent() => Column(
    children: [
      _recentRow('Ubud, Bali', 'bali.jpg'),
      _recentRow('Raja Ampat', 'rajaampat.jpg'),
    ],
  );

  Widget _recentRow(String n, String img) => ListTile(
    leading: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/$img',
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    ),
    title: Text(n, style: const TextStyle(fontWeight: FontWeight.bold)),
    trailing: Image.asset('assets/images/heart.png', width: 20),
  );
}
