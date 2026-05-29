import 'dart:async';
import 'dart:convert';

import 'package:apliasi_doa/homepage.dart';
import 'package:apliasi_doa/pages/schedule.dart';
import 'package:apliasi_doa/service/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PrayerTimePage extends StatefulWidget {
  const PrayerTimePage({super.key});

  @override
  State<PrayerTimePage> createState() => _PrayerTimePageState();
}

class _PrayerTimePageState extends State<PrayerTimePage> {
  DateTime currentTime = DateTime.now();

  /// PILIH KOTA
  String selectedCity = "Jakarta";

  bool isLoading = true;

  List<String> filteredCities = [];

  /// DATA SHOLAT
  Map<String, dynamic> prayerTimes = {};

  /// LIST PROVINSI + KOTA + DESA
  final Map<String, Map<String, double>> cityCoordinates = {
    /// DKI JAKARTA
    "Jakarta": {"lat": -6.2088, "lng": 106.8456},
    "Jakarta Selatan": {"lat": -6.2615, "lng": 106.8106},
    "Jakarta Barat": {"lat": -6.1683, "lng": 106.7588},
    "Jakarta Timur": {"lat": -6.2250, "lng": 106.9004},
    "Jakarta Utara": {"lat": -6.1380, "lng": 106.8636},
    "Jakarta Pusat": {"lat": -6.1864, "lng": 106.8342},

    /// JAWA BARAT
    "Bandung": {"lat": -6.9175, "lng": 107.6191},
    "Bekasi": {"lat": -6.2349, "lng": 106.9896},
    "Bogor": {"lat": -6.5971, "lng": 106.8060},
    "Depok": {"lat": -6.4025, "lng": 106.7942},
    "Cimahi": {"lat": -6.8722, "lng": 107.5425},
    "Tasikmalaya": {"lat": -7.3274, "lng": 108.2207},
    "Cirebon": {"lat": -6.7320, "lng": 108.5523},
    "Garut": {"lat": -7.2279, "lng": 107.9087},
    "Subang": {"lat": -6.5717, "lng": 107.7587},
    "Karawang": {"lat": -6.3054, "lng": 107.2961},
    "Purwakarta": {"lat": -6.5569, "lng": 107.4430},
    "Sukabumi": {"lat": -6.9181, "lng": 106.9267},
    "Pangandaran": {"lat": -7.6930, "lng": 108.6537},

    /// DESA JAWA BARAT
    "Lembang": {"lat": -6.8117, "lng": 107.6175},
    "Ciwidey": {"lat": -7.0999, "lng": 107.4390},
    "Pangalengan": {"lat": -7.1792, "lng": 107.5678},
    "Parung": {"lat": -6.4217, "lng": 106.7333},
    "Jatinangor": {"lat": -6.9272, "lng": 107.7700},

    /// JAWA TENGAH
    "Semarang": {"lat": -6.9667, "lng": 110.4167},
    "Solo": {"lat": -7.5666, "lng": 110.8167},
    "Magelang": {"lat": -7.4706, "lng": 110.2177},
    "Purwokerto": {"lat": -7.4241, "lng": 109.2396},
    "Pekalongan": {"lat": -6.8892, "lng": 109.6753},
    "Tegal": {"lat": -6.8694, "lng": 109.1402},
    "Salatiga": {"lat": -7.3305, "lng": 110.5084},
    "Cilacap": {"lat": -7.7326, "lng": 109.0069},
    "Kudus": {"lat": -6.8048, "lng": 110.8405},
    "Jepara": {"lat": -6.5820, "lng": 110.6782},

    /// DESA JAWA TENGAH
    "Dieng": {"lat": -7.2092, "lng": 109.9139},
    "Bandungan": {"lat": -7.2250, "lng": 110.3500},
    "Ambarawa": {"lat": -7.2559, "lng": 110.4020},

    /// DI YOGYAKARTA
    "Yogyakarta": {"lat": -7.7956, "lng": 110.3695},
    "Sleman": {"lat": -7.7167, "lng": 110.3556},
    "Bantul": {"lat": -7.8881, "lng": 110.3288},
    "Kulon Progo": {"lat": -7.8267, "lng": 110.1641},
    "Gunung Kidul": {"lat": -7.9787, "lng": 110.6033},

    /// JAWA TIMUR
    "Surabaya": {"lat": -7.2575, "lng": 112.7521},
    "Malang": {"lat": -7.9666, "lng": 112.6326},
    "Batu": {"lat": -7.8710, "lng": 112.5281},
    "Kediri": {"lat": -7.8480, "lng": 112.0178},
    "Madiun": {"lat": -7.6298, "lng": 111.5239},
    "Pasuruan": {"lat": -7.6451, "lng": 112.9075},
    "Probolinggo": {"lat": -7.7543, "lng": 113.2159},
    "Sidoarjo": {"lat": -7.4478, "lng": 112.7183},
    "Gresik": {"lat": -7.1568, "lng": 112.6555},
    "Jember": {"lat": -8.1724, "lng": 113.7000},
    "Banyuwangi": {"lat": -8.2192, "lng": 114.3691},

    /// DESA JAWA TIMUR
    "Bromo": {"lat": -7.9425, "lng": 112.9530},
    "Pacet": {"lat": -7.6790, "lng": 112.5470},
    "Trawas": {"lat": -7.6872, "lng": 112.6212},

    /// SUMATERA
    "Banda Aceh": {"lat": 5.5483, "lng": 95.3238},
    "Lhokseumawe": {"lat": 5.1801, "lng": 97.1507},
    "Medan": {"lat": 3.5952, "lng": 98.6722},
    "Binjai": {"lat": 3.6001, "lng": 98.4854},
    "Padang": {"lat": -0.9471, "lng": 100.4172},
    "Pekanbaru": {"lat": 0.5071, "lng": 101.4478},
    "Batam": {"lat": 1.0456, "lng": 104.0305},
    "Jambi": {"lat": -1.6101, "lng": 103.6131},
    "Palembang": {"lat": -2.9761, "lng": 104.7754},
    "Lampung": {"lat": -5.4292, "lng": 105.2610},
    "Bengkulu": {"lat": -3.8004, "lng": 102.2655},
    "Pangkal Pinang": {"lat": -2.1316, "lng": 106.1169},

    /// KALIMANTAN
    "Pontianak": {"lat": -0.0263, "lng": 109.3425},
    "Palangkaraya": {"lat": -2.2096, "lng": 113.9213},
    "Banjarmasin": {"lat": -3.3194, "lng": 114.5908},
    "Banjarbaru": {"lat": -3.4421, "lng": 114.8453},
    "Samarinda": {"lat": -0.5022, "lng": 117.1537},
    "Balikpapan": {"lat": -1.2379, "lng": 116.8529},
    "Tarakan": {"lat": 3.3130, "lng": 117.5915},

    /// SULAWESI
    "Makassar": {"lat": -5.1477, "lng": 119.4327},
    "Parepare": {"lat": -4.0135, "lng": 119.6255},
    "Palopo": {"lat": -2.9945, "lng": 120.1969},
    "Manado": {"lat": 1.4748, "lng": 124.8421},
    "Bitung": {"lat": 1.4451, "lng": 125.1824},
    "Tomohon": {"lat": 1.3236, "lng": 124.8408},
    "Palu": {"lat": -0.8917, "lng": 119.8707},
    "Kendari": {"lat": -3.9985, "lng": 122.5120},
    "Gorontalo": {"lat": 0.5435, "lng": 123.0568},

    /// BALI & NUSA TENGGARA
    "Denpasar": {"lat": -8.6705, "lng": 115.2126},
    "Singaraja": {"lat": -8.1120, "lng": 115.0882},
    "Ubud": {"lat": -8.5069, "lng": 115.2625},
    "Kuta": {"lat": -8.7238, "lng": 115.1752},
    "Mataram": {"lat": -8.5833, "lng": 116.1167},
    "Bima": {"lat": -8.4606, "lng": 118.7274},
    "Kupang": {"lat": -10.1772, "lng": 123.6070},
    "Maumere": {"lat": -8.6199, "lng": 122.2111},
    "Ende": {"lat": -8.8432, "lng": 121.6625},

    /// PAPUA
    "Jayapura": {"lat": -2.5337, "lng": 140.7181},
    "Sorong": {"lat": -0.8762, "lng": 131.2558},
    "Manokwari": {"lat": -0.8615, "lng": 134.0788},
    "Biak": {"lat": -1.0381, "lng": 136.0827},
    "Merauke": {"lat": -8.4932, "lng": 140.4018},
    "Nabire": {"lat": -3.3667, "lng": 135.4833},
  };

  @override
  void initState() {
    super.initState();

    filteredCities = cityCoordinates.keys.toList();

    getPrayerTime();

    /// JAM REALTIME
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  /// FORMAT JAM
  String formatClock(DateTime time) {
    String hour = time.hour.toString().padLeft(2, '0');
    String minute = time.minute.toString().padLeft(2, '0');
    String second = time.second.toString().padLeft(2, '0');

    return "$hour : $minute : $second";
  }

  /// API JADWAL SHOLAT
  Future<void> getPrayerTime() async {
    setState(() {
      isLoading = true;
    });

    try {
      double lat = cityCoordinates[selectedCity]!['lat']!;
      double lng = cityCoordinates[selectedCity]!['lng']!;

      String url =
          "https://api.aladhan.com/v1/timings?latitude=$lat&longitude=$lng&method=11";

      final response = await http.get(Uri.parse(url));

      final data = jsonDecode(response.body);

      final timings = data['data']['timings'];

      setState(() {
        prayerTimes = {
          "Subuh": timings['Fajr'],
          "Dzuhur": timings['Dhuhr'],
          "Ashar": timings['Asr'],
          "Maghrib": timings['Maghrib'],
          "Isya": timings['Isha'],
        };

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error : $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> prayerList = [
      {
        "title": "FAJAR",
        "time": prayerTimes["Subuh"] ?? "--:--",
        "subtitle": "Subuh",
        "icon": Icons.wb_twilight,
        "color": const Color(0xff4FFFE0),
      },
      {
        "title": "DZUHUR",
        "time": prayerTimes["Dzuhur"] ?? "--:--",
        "subtitle": "Dzuhur",
        "icon": Icons.wb_sunny,
        "color": const Color(0xff6FFFF3),
      },
      {
        "title": "ASHAR",
        "time": prayerTimes["Ashar"] ?? "--:--",
        "subtitle": "Ashar",
        "icon": Icons.sunny,
        "color": const Color(0xff5CE1E6),
      },
      {
        "title": "MAGHRIB",
        "time": prayerTimes["Maghrib"] ?? "--:--",
        "subtitle": "Maghrib",
        "icon": Icons.nightlight_round,
        "color": const Color(0xff3DDAD7),
      },
      {
        "title": "ISYA",
        "time": prayerTimes["Isya"] ?? "--:--",
        "subtitle": "Isya",
        "icon": Icons.dark_mode,
        "color": const Color(0xff54D6FF),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff02152D),

      /// APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xff02152D),
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),

          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          },
        ),

        title: const Text("Prayer Time", style: TextStyle(color: Colors.white)),

        centerTitle: true,
      ),

      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xff5CE1E6)),
            )
          : Padding(
              padding: const EdgeInsets.all(18),

              child: Column(
                children: [
                  /// ICON
                  Container(
                    width: 90,
                    height: 90,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      gradient: const LinearGradient(
                        colors: [Color(0xff34D1E7), Color(0xff1B7F8A)],
                      ),
                    ),

                    child: Icon(MdiIcons.mosque, color: Colors.white, size: 42),
                  ),

                  const SizedBox(height: 20),

                  /// JAM DIGITAL
                  Text(
                    formatClock(currentTime),

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DROPDOWN DAERAH
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),

                    decoration: BoxDecoration(
                      color: const Color(0xff0A2747),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: const Color(0xff0A2747),

                        value: selectedCity,

                        isExpanded: true,

                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),

                        items: filteredCities.map((city) {
                          return DropdownMenuItem<String>(
                            value: city,

                            child: Text(
                              city,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),

                        onChanged: (value) {
                          setState(() {
                            selectedCity = value!;
                          });

                          getPrayerTime();
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// LIST SHOLAT
                  Expanded(
                    child: ListView.builder(
                      itemCount: prayerList.length,

                      itemBuilder: (context, index) {
                        final item = prayerList[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(16),

                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff0D2B4B), Color(0xff133C5F)],
                            ),

                            borderRadius: BorderRadius.circular(24),
                          ),

                          child: Row(
                            children: [
                              /// ICON
                              Container(
                                width: 60,
                                height: 60,

                                decoration: BoxDecoration(
                                  color: item['color'].withOpacity(0.15),
                                  shape: BoxShape.circle,
                                ),

                                child: Icon(
                                  item['icon'],
                                  color: item['color'],
                                  size: 30,
                                ),
                              ),

                              const SizedBox(width: 16),

                              /// TITLE
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      item['title'],

                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      item['subtitle'],

                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// JAM
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: item['color'].withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(14),
                                ),

                                child: Text(
                                  item['time'],

                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: item['color'],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff0A1F38),
        currentIndex: 1,

        selectedItemColor: const Color(0xff5CE1E6),
        unselectedItemColor: Colors.white54,

        onTap: (index) {
          /// HOME
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
          /// SCHEDULE
          else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Schedule()),
            );
          }
          /// PROFILE
          else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Schedule",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
