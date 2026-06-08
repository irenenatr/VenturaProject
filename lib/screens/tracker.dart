import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ExpenseTrackerScreen extends StatefulWidget {
  const ExpenseTrackerScreen({super.key});

  @override
  State<ExpenseTrackerScreen> createState() => _ExpenseTrackerScreenState();
}

class _ExpenseTrackerScreenState extends State<ExpenseTrackerScreen> {
  // 1. Variabel untuk menyimpan kategori yang sedang dipilih
  String selectedCategory = "All";

  // 2. Data Dummy Pengeluaran
  final List<Map<String, dynamic>> allExpenses = [
    {
      "category": "Transport",
      "sub": "Taxi",
      "time": "09:30",
      "price": "Rp. 3.500.000",
      "color": const Color(0xFFFFECC0),
      "icon": Icons.directions_bus_filled,
      "date": "Today",
    },
    {
      "category": "Food",
      "sub": "Lunch",
      "time": "12:45",
      "price": "Rp. 1.200.000",
      "color": const Color(0xFFABE1E1),
      "icon": Icons.restaurant,
      "date": "Today",
    },
    {
      "category": "Activities",
      "sub": "Snorkeling",
      "time": "15:20",
      "price": "Rp. 2.500.000",
      "color": const Color(0xFFFA855A),
      "icon": Icons.fitness_center,
      "date": "Today",
    },
    {
      "category": "Accomodation",
      "sub": "Hotel",
      "time": "14:00",
      "price": "Rp. 5.000.000",
      "color": const Color(0xFF4A97CB),
      "icon": Icons.hotel,
      "date": "Yesterday",
    },
    {
      "category": "Food",
      "sub": "Dinner",
      "time": "19:30",
      "price": "Rp. 800.000",
      "color": const Color(0xFFABE1E1),
      "icon": Icons.restaurant,
      "date": "Yesterday",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 3. Filter data berdasarkan kategori yang dipilih
    List<Map<String, dynamic>> filteredExpenses = allExpenses.where((expense) {
      return selectedCategory == "All" ||
          expense['category'] == selectedCategory;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.clouds,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildBudgetOverviewCard(),
                  const SizedBox(height: 30),

                  // TAB FILTER
                  _buildCategoryTabs(),

                  const SizedBox(height: 30),

                  // LIST HASIL FILTER
                  if (filteredExpenses.isEmpty)
                    const Center(
                      child: Text("No expenses found in this category"),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Transactions",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            color: AppColors.deepOcean,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ...filteredExpenses.map(
                          (item) => _buildTransactionItem(
                            item['category'],
                            item['sub'],
                            item['time'],
                            item['price'],
                            item['color'],
                            item['icon'],
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header dengan Judul di Tengah Presisi
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          decoration: const BoxDecoration(
            color: AppColors.brandBlue,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(250, 40),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
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
                      color: AppColors.deepOcean,
                      size: 24,
                    ),
                  ),
                ),
                // Expanded + Center agar judul benar-benar di tengah layar
                const Expanded(
                  child: Center(
                    child: Text(
                      "Expense Tracker",
                      style: TextStyle(
                        fontFamily: 'Chango',
                        fontSize: 22,
                        color: AppColors.deepOcean,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetOverviewCard() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Budget",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                    color: AppColors.deepOcean,
                  ),
                ),
                const Text(
                  "Rp. 7.500.000",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: AppColors.deepOcean,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _budgetMiniInfo(
                      "Spent",
                      "Rp. 4.000.000",
                      const Color(0xFFCA3537),
                    ),
                    const SizedBox(width: 20),
                    _budgetMiniInfo(
                      "Remaining",
                      "Rp. 3.500.000",
                      AppColors.bluebird,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Progress Circle
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 85,
                width: 85,
                child: CircularProgressIndicator(
                  value: 0.53,
                  strokeWidth: 9,
                  backgroundColor: Colors.grey.shade100,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.bluebird,
                  ),
                ),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "53%",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "of budget\nused",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _budgetMiniInfo(String label, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w800,
            fontSize: 11,
            color: color,
          ),
        ),
      ],
    );
  }

  // --- LOGIKA FILTER TAB ---
  Widget _buildCategoryTabs() {
    final categories = [
      "All",
      "Transport",
      "Food",
      "Accomodation",
      "Activities",
    ];
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String cat = categories[index];
          bool isSelected = selectedCategory == cat;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = cat; // Mengubah state filter
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                boxShadow: isSelected
                    ? [const BoxShadow(color: Colors.black12, blurRadius: 4)]
                    : [],
              ),
              child: Center(
                child: Text(
                  cat,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? AppColors.deepOcean : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransactionItem(
    String cat,
    String sub,
    String time,
    String price,
    Color iconBg,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: iconBg.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.deepOcean, size: 22),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      cat,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: AppColors.deepOcean,
                      ),
                    ),
                    const Text("  •  ", style: TextStyle(color: Colors.grey)),
                    Text(
                      sub,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
              fontSize: 13,
              color: AppColors.deepOcean,
            ),
          ),
        ],
      ),
    );
  }
}
