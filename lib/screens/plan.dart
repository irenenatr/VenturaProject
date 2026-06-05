import 'package:flutter/material.dart';
import '../utils/colors.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  bool isShowingItinerary = false; // State untuk toggle Map vs Schedule
  int selectedDay = 1; // State untuk hari yang dipilih

  // DATABASE ITINERARY BERDASARKAN GAMBAR PLAN 1, 2, 3
  final Map<int, List<Map<String, String>>> tripData = {
    1: [
      {
        "time": "08.00 AM",
        "title": "Komodough",
        "loc": "Soekarno Hatta, Labuan Bajo",
        "img": "komodough.webp",
      },
      {
        "time": "10.00 AM",
        "title": "Exotic Komodo Souvenir Shop",
        "loc": "Yohanis Sahadun, Labuan Bajo",
        "img": "souvenir.webp",
      },
      {
        "time": "12.30 AM",
        "title": "Carpenter Café & Roastery",
        "loc": "Soekarno Hatta, Labuan Bajo",
        "img": "carpenter.jpeg",
      },
      {
        "time": "03.00 PM",
        "title": "Puncak Waringin",
        "loc": "Komodo, Labuan Bajo",
        "img": "puncak.webp",
      },
      {
        "time": "05.30 PM",
        "title": "Amelia Hill",
        "loc": "Komodo, Labuan Bajo",
        "img": "hill.webp",
      },
      {
        "time": "07.30 PM",
        "title": "Kampung Ujung",
        "loc": "Soekarno Hatta, Labuan Bajo",
        "img": "kmpngujung.jpeg",
      },
    ],
    2: [
      {
        "time": "06.30 AM",
        "title": "Labuan Bajo Harbor",
        "loc": "Marina Waterfront, Labuan Bajo",
        "img": "harbor.jpeg",
      },
      {
        "time": "08.00 AM",
        "title": "Padar Island",
        "loc": "Komodo National Park",
        "img": "padar.jpeg",
      },
      {
        "time": "10.30 PM",
        "title": "Pink Beach",
        "loc": "Komodo National Park",
        "img": "pinkb.jpeg",
      },
      {
        "time": "01.00 PM",
        "title": "Komodo Island",
        "loc": "Komodo National Park",
        "img": "komodo.jpeg",
      },
      {
        "time": "03.30 PM",
        "title": "Taka Makassar",
        "loc": "Komodo National Park",
        "img": "taka.jpeg",
      },
      {
        "time": "05.00 PM",
        "title": "Manta Point",
        "loc": "Komodo National Park",
        "img": "manta.webp",
      },
      {
        "time": "07.30 PM",
        "title": "Atlantis on The Rock",
        "loc": "Komodo, Labuan Bajo",
        "img": "atlantis.jpeg",
      },
    ],
    3: [
      {
        "time": "08.30 AM",
        "title": "Le Pirate Restaurant",
        "loc": "Komodo, Labuan Bajo",
        "img": "lepirate.avif",
      },
      {
        "time": "10.00 AM",
        "title": "Sylvia Hill",
        "loc": "Komodo, Labuan Bajo",
        "img": "shill.webp",
      },
      {
        "time": "12.30 PM",
        "title": "Sei Sapi Lejong",
        "loc": "Yohanis Sahadun, Labuan Bajo",
        "img": "sei.webp",
      },
      {
        "time": "03.00 PM",
        "title": "Waterfront Marina",
        "loc": "Soekarno Hatta, Labuan Bajo",
        "img": "marina.jpeg",
      },
      {
        "time": "05.30 PM",
        "title": "Komodo International Airport",
        "loc": "Komodo, Labuan Bajo",
        "img": "airport.jpg",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Menampilkan Map View atau Trip Schedule View
    return isShowingItinerary ? _buildTripScheduleView() : _buildMapView();
  }

  // --- TAMPILAN MAP (Berdasarkan gambar Map) ---
  Widget _buildMapView() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/map_full.png', fit: BoxFit.cover),
        ),
        // Floating Card di Bawah
        Positioned(
          bottom: 100,
          left: 20,
          right: 20,
          child: Container(
            height: 220,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.coralGlow,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Day $selectedDay",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => isShowingItinerary = true),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_drop_up, color: AppColors.deepOcean),
                          Text(
                            "View all",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Horizontal Preview Cards
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: tripData[selectedDay]!.take(2).map((item) {
                      return Container(
                        width: 250,
                        margin: const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.clouds,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/${item['img']}',
                                width: 100,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item['title']!,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13,
                                      height: 1.1,
                                    ),
                                  ),
                                  Text(
                                    item['loc']!,
                                    style: const TextStyle(
                                      fontSize: 9,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // --- TAMPILAN TRIP SCHEDULE (Berdasarkan plan1, plan2, plan3) ---
  Widget _buildTripScheduleView() {
    return Scaffold(
      backgroundColor: AppColors.clouds,
      body: Column(
        children: [
          _buildHeader(),
          _buildDaySelector(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(25, 30, 25, 100),
                itemCount: tripData[selectedDay]!.length,
                itemBuilder: (context, index) {
                  final item = tripData[selectedDay]![index];
                  return _buildScheduleItem(
                    index + 1,
                    item['time']!,
                    item['title']!,
                    item['loc']!,
                    item['img']!,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 160,
          decoration: const BoxDecoration(
            color: Color(0xFFC7E3EA), // Warna biru header explore
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(200, 30),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => setState(
                        () => isShowingItinerary = false,
                      ), // BALIK KE MAP
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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Trip Schedule",
                  style: TextStyle(
                    fontFamily: 'Chango',
                    fontSize: 28,
                    color: AppColors.deepOcean,
                  ),
                ),
                const Text(
                  "A complete day-by-day guide for your next journey",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF10537D),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDaySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [1, 2, 3].map((day) {
          bool active = selectedDay == day;
          return GestureDetector(
            onTap: () => setState(() => selectedDay = day),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: active ? AppColors.coralGlow : const Color(0xFFFEF9E6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: active
                    ? [
                        BoxShadow(
                          color: AppColors.coralGlow.withOpacity(0.3),
                          blurRadius: 10,
                        ),
                      ]
                    : [],
              ),
              child: Text(
                "Day $day",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: active
                      ? Colors.white
                      : AppColors.coralGlow.withOpacity(0.4),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildScheduleItem(
    int num,
    String time,
    String title,
    String loc,
    String img,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nomor Bulat Miring seperti Figma
          Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              color: Color(0xFFFEF9E6),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "$num",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: AppColors.deepOcean,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Kartu Detail
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF9E6),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: AppColors.deepOcean,
                          ),
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            color: Color(0xFF10537D),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          loc,
                          style: const TextStyle(
                            fontSize: 9,
                            color: Color(0xFF10537D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/$img',
                      width: 65,
                      height: 65,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
