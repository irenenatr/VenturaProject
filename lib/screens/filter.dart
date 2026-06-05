import 'package:flutter/material.dart';
import '../utils/colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Map untuk menyimpan status pilihan
  final Map<String, List<String>> _selectedFilters = {
    "days": [],
    "accommodation": [],
    "budget": [],
    "travelers": [],
    "tripType": [], // Ini satu-satunya yang Multiple Choice
  };

  // Fungsi Logika Pemilihan
  void _handleSelection(String category, String value) {
    setState(() {
      if (category == "tripType") {
        // --- LOGIKA MULTIPLE CHOICE ---
        if (_selectedFilters[category]!.contains(value)) {
          _selectedFilters[category]!.remove(value);
        } else {
          _selectedFilters[category]!.add(value);
        }
      } else {
        // --- LOGIKA SINGLE CHOICE ---
        if (_selectedFilters[category]!.contains(value)) {
          _selectedFilters[category]!.clear(); // Hapus jika pencet yang sama
        } else {
          _selectedFilters[category]!.clear(); // Hapus pilihan lama
          _selectedFilters[category]!.add(value); // Tambah pilihan baru
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSubHeader(),
                  const SizedBox(height: 10),

                  _buildFilterSection(
                    "How many days are you planning to travel?",
                    ["1 - 2 Days", "3 - 4 Days", "5 - 7 Days", "7+ Days"],
                    "days",
                  ),

                  _buildFilterSection(
                    "What type of accommodation do you prefer?",
                    ["Budget", "Mid-range", "Luxury", "Unique Stay"],
                    "accommodation",
                  ),

                  _buildFilterSection("What is your budget range?", [
                    "< Rp500K",
                    "Rp500K - 1M",
                    "Rp1M - 2.5M",
                    "> Rp2.5M",
                  ], "budget"),

                  _buildFilterSection("Who are you traveling with?", [
                    "Solo",
                    "Couple",
                    "Friends",
                    "Family",
                  ], "travelers"),

                  // Bagian ini Multiple Choice
                  _buildFilterSection(
                    "What kind of trip are you looking for? (Optional)",
                    [
                      "Adventure",
                      "Relaxation",
                      "Nature",
                      "Culture",
                      "Foodie",
                      "Beach",
                      "Shopping",
                      "Other...",
                    ],
                    "tripType",
                  ),

                  const SizedBox(height: 40),
                  _buildActionButton(context),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.brandBlue, // Biru #ABE1E1
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
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
                        Icons.arrow_back,
                        color: AppColors.deepOcean,
                        size: 20,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Filter",
              style: TextStyle(
                fontFamily: 'Chango',
                fontSize: 26,
                color: AppColors.deepOcean,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Tell us about your trip,\nwe’ll do the rest.",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF10537D),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            _selectedFilters.forEach((key, value) => value.clear());
          }),
          child: const Text(
            "Reset",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: AppColors.bluebird,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterSection(
    String title,
    List<String> options,
    String category,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: AppColors.deepOcean,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: options.map((option) {
            bool isSelected = _selectedFilters[category]!.contains(option);
            return GestureDetector(
              onTap: () => _handleSelection(category, option),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.coralGlow
                      : Colors.white, // Merah/Oren saat dipilih
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: isSelected ? AppColors.coralGlow : Colors.black12,
                    width: 1.5,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.coralGlow.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? Colors.white : AppColors.bluebird,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // Cari widget _buildActionButton() di filter_screen.dart
  Widget _buildActionButton(BuildContext context) {
    // Tambahkan context
    return GestureDetector(
      onTap: () {
        // 1. Logika simulasi loading/generate bisa ditaruh di sini
        // 2. Tutup filter dan kirim data 'true' sebagai tanda sukses generate
        Navigator.pop(context, true);
      },
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: AppColors.bluebird,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Show Recommendations",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Pastikan di bagian build() kamu memanggilnya dengan context:
  // _buildActionButton(context),
}
