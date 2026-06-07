import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ExpenseTrackerScreen extends StatelessWidget {
  const ExpenseTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                _buildCategoryTabs(),
                const SizedBox(height: 30),
                
                // Section Today
                const Text("Today", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, color: AppColors.deepOcean, fontSize: 14)),
                const SizedBox(height: 15),
                _buildTransactionItem("Transport", "Taxi", "09:30", "Rp. 3.500.000", const Color(0xFFFFECC0), Icons.directions_bus_filled),
                _buildTransactionItem("Food & Drinks", "Lunch", "12:45", "Rp. 3.500.000", const Color(0xFFABE1E1), Icons.restaurant),
                _buildTransactionItem("Activities", "Snorkeling", "15:20", "Rp. 3.500.000", const Color(0xFFFA855A), Icons.fitness_center),
                
                const SizedBox(height: 20),
                
                // Section Yesterday
                const Text("Yesterday", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, color: AppColors.deepOcean, fontSize: 14)),
                const SizedBox(height: 15),
                _buildTransactionItem("Accomodation", "Hotel", "14:00", "Rp. 3.500.000", const Color(0xFF4A97CB), Icons.hotel),
                _buildTransactionItem("Food & Drinks", "Dinner", "19:30", "Rp. 3.500.000", const Color(0xFFABE1E1), Icons.restaurant),
                
                const SizedBox(height: 120), // Ruang untuk Navbar
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 1. Header Biru Melengkung
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          decoration: const BoxDecoration(
            color: AppColors.brandBlue,
            borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(250, 40)),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {}, // Logic back if needed
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.arrow_back_rounded, color: AppColors.deepOcean, size: 24),
                  ),
                ),
                const Text("Expense Tracker", style: TextStyle(fontFamily: 'Chango', fontSize: 24, color: AppColors.deepOcean)),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
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

  // 2. Budget Overview Card (Kotak Putih Atas)
  Widget _buildBudgetOverviewCard() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Total Budget", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 12, color: AppColors.deepOcean)),
                const Text("Rp. 7.500.000", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 18, color: AppColors.deepOcean)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _budgetMiniInfo("Spent", "Rp. 4.000.000", const Color(0xFFCA3537)),
                    const SizedBox(width: 20),
                    _budgetMiniInfo("Remaining", "Rp. 3.500.000", AppColors.bluebird),
                  ],
                )
              ],
            ),
          ),
          // Circular Progress Indicator
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 90, width: 90,
                child: CircularProgressIndicator(
                  value: 0.53,
                  strokeWidth: 10,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.bluebird),
                ),
              ),
              const Column(
                children: [
                  Text("53%", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 16)),
                  Text("of budget\nused", textAlign: TextAlign.center, style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _budgetMiniInfo(String label, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.grey)),
        Text(amount, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 11, color: color)),
      ],
    );
  }

  // 3. Category Filter Tabs
  Widget _buildCategoryTabs() {
    final categories = ["All", "Transport", "Food", "Accomodation", "Other"];
    return Container(
      height: 40,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isAll = index == 0;
          return Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: isAll ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(categories[index], 
                style: TextStyle(fontFamily: 'Poppins', fontSize: 10, fontWeight: FontWeight.bold, color: isAll ? AppColors.deepOcean : Colors.grey)),
            ),
          );
        },
      ),
    );
  }

  // 4. Transaction List Item
  Widget _buildTransactionItem(String cat, String sub, String time, String price, Color iconBg, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          // Icon Circle
          Container(
            height: 50, width: 50,
            decoration: BoxDecoration(color: iconBg.withOpacity(0.4), shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.deepOcean, size: 24),
          ),
          const SizedBox(width: 15),
          // Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(cat, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.deepOcean)),
                    const Text("  •  ", style: TextStyle(color: Colors.grey)),
                    Text(sub, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 11, color: Colors.grey)),
                  ],
                ),
                Text(time, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
              ],
            ),
          ),
          // Price
          Text(price, style: const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 13, color: AppColors.deepOcean)),
        ],
      ),
    );
  }
}