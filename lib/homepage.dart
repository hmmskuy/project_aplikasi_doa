import 'dart:async';
import 'package:apliasi_doa/pages/prayer_time.dart';
import 'package:apliasi_doa/pages/schedule.dart';
import 'package:apliasi_doa/service/profile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:apliasi_doa/widgets/dummy_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// CURRENT TIME
  DateTime currentTime = DateTime.now();

  /// NOTIFICATION
  String notificationText = "";
  bool showNotification = false;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
        checkAdzanNotification();
      });
    });
  }

  /// FORMAT TIME
  String formatTime(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;

    String period = hour >= 12 ? "PM" : "AM";

    hour = hour % 12;

    if (hour == 0) {
      hour = 12;
    }

    String hourString = hour.toString().padLeft(2, '0');
    String minuteString = minute.toString().padLeft(2, '0');

    return "$hourString:$minuteString $period";
  }

  /// NOTIFIKASI 10 MENIT SEBELUM ADZAN
  void checkAdzanNotification() {
    final List<Map<String, dynamic>> prayerSchedule = [
      {"name": "Subuh", "hour": 4, "minute": 36},
      {"name": "Dzuhur", "hour": 11, "minute": 52},
      {"name": "Ashar", "hour": 15, "minute": 13},
      {"name": "Maghrib", "hour": 17, "minute": 48},
      {"name": "Isya", "hour": 19, "minute": 00},
    ];

    showNotification = false;

    for (var prayer in prayerSchedule) {
      DateTime prayerTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        prayer['hour'],
        prayer['minute'],
      );

      Duration difference = prayerTime.difference(currentTime);

      /// 10 MENIT SEBELUM ADZAN
      if (difference.inMinutes <= 10 && difference.inMinutes >= 0) {
        notificationText =
            "⏰ ${prayer['name']} akan adzan dalam ${difference.inMinutes} menit";

        showNotification = true;

        break;
      }
    }
  }

  /// WIDGET TIME CARD
  Widget buildTimeCard(String title, String time, double screenWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: screenWidth < 360 ? 16 : 20),

      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth < 360 ? 12 : 14,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth < 360 ? 18 : 22,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// RESPONSIVE
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isSmallPhone = screenWidth < 360;

    /// JADWAL SHOLAT
    final List<Map<String, dynamic>> prayerSchedule = [
      {"name": "Fajr", "hour": 4, "minute": 36, "icon": Icons.wb_twilight},

      {"name": "Dzuhur", "hour": 11, "minute": 52, "icon": Icons.wb_sunny},

      {"name": "Ashar", "hour": 15, "minute": 13, "icon": Icons.sunny},

      {
        "name": "Maghrib",
        "hour": 17,
        "minute": 48,
        "icon": Icons.nightlight_round,
      },

      {"name": "Isya", "hour": 19, "minute": 00, "icon": Icons.dark_mode},
    ];

    /// DEFAULT VALUE
    String currentPrayer = "Dzuhur";

    IconData currentIcon = Icons.wb_sunny;

    DateTime endPrayer = currentTime;

    for (var prayer in prayerSchedule) {
      DateTime prayerTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        prayer['hour'],
        prayer['minute'],
      );

      if (currentTime.isBefore(prayerTime)) {
        currentPrayer = prayer['name'];

        currentIcon = prayer['icon'];

        endPrayer = prayerTime;

        break;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xff071426),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(isSmallPhone ? 10 : 16),

        decoration: BoxDecoration(
          color: const Color(0xff0D1B2A),
          borderRadius: BorderRadius.circular(30),

          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),

        child: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,

          selectedItemColor: Colors.tealAccent,
          unselectedItemColor: Colors.white54,

          selectedFontSize: isSmallPhone ? 10 : 12,
          unselectedFontSize: isSmallPhone ? 9 : 11,

          onTap: (index) {
            /// HOME
            if (index == 0) {
              // halaman home
            }
            /// SCHEDULE
            else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Schedule()),
              );
            }
            /// PROFILE
            else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            }
          },

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Schedule",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallPhone ? 14 : 20,
            vertical: screenHeight * 0.02,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                children: [
                  CircleAvatar(
                    radius: isSmallPhone ? 24 : 28,
                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.person,
                      color: Colors.grey.shade700,
                      size: isSmallPhone ? 24 : 28,
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.04),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Assalamu Alaikum!",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isSmallPhone ? 12 : 15,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "Hamm❤️ra",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallPhone ? 20 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// ICON NOTIFIKASI
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(isSmallPhone ? 10 : 12),

                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: isSmallPhone ? 20 : 24,
                        ),
                      ),

                      if (showNotification)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 12,
                            height: 12,

                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),

              /// NOTIFIKASI
              if (showNotification)
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(isSmallPhone ? 12 : 16),

                  decoration: BoxDecoration(
                    color: Colors.orange.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                        size: isSmallPhone ? 20 : 24,
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          notificationText,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: isSmallPhone ? 12 : 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              SizedBox(height: screenHeight * 0.03),

              SizedBox(height: screenHeight * 0.03),

              /// MAIN CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isSmallPhone ? 18 : 24),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),

                  gradient: const LinearGradient(
                    colors: [Color(0xff2BC0C8), Color(0xff0F2027)],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),

                child: Column(
                  children: [
                    Container(
                      width: isSmallPhone ? 65 : 80,
                      height: isSmallPhone ? 65 : 80,

                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),

                      child: Icon(
                        currentIcon,
                        color: Colors.white,
                        size: isSmallPhone ? 30 : 40,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    Text(
                      currentPrayer,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallPhone ? 30 : 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.01),

                    Text(
                      "Current Prayer Time",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: isSmallPhone ? 14 : 18,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    screenWidth < 380
                        ? Column(
                            children: [
                              buildTimeCard(
                                "NOW",
                                formatTime(currentTime),
                                screenWidth,
                              ),

                              const SizedBox(height: 15),

                              buildTimeCard(
                                "NEXT",
                                formatTime(endPrayer),
                                screenWidth,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: buildTimeCard(
                                  "NOW",
                                  formatTime(currentTime),
                                  screenWidth,
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: buildTimeCard(
                                  "NEXT",
                                  formatTime(endPrayer),
                                  screenWidth,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              /// TITLE
              Text(
                "Daily Features",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallPhone ? 22 : 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: screenHeight * 0.025),

              /// GRID MENU
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;

                  if (constraints.maxWidth < 360) {
                    crossAxisCount = 1;
                  } else if (constraints.maxWidth < 600) {
                    crossAxisCount = 2;
                  } else {
                    crossAxisCount = 3;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: DummyDatabase.menuHome.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,

                      childAspectRatio: constraints.maxWidth < 360
                          ? 1.05
                          : 0.85,
                    ),

                    itemBuilder: (context, index) {
                      var item = DummyDatabase.menuHome[index];

                      return InkWell(
                        borderRadius: BorderRadius.circular(30),

                        onTap: () {
                          if (item['page'] != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => item['page'],
                              ),
                            );
                          }
                        },

                        child: Container(
                          padding: EdgeInsets.all(isSmallPhone ? 14 : 18),

                          decoration: BoxDecoration(
                            color: const Color(0xff102033),
                            borderRadius: BorderRadius.circular(30),

                            border: Border.all(color: Colors.white10),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              /// ICON TENGAH BESAR
                              Container(
                                width: isSmallPhone ? 80 : 100,
                                height: isSmallPhone ? 80 : 100,

                                decoration: BoxDecoration(
                                  color: Colors.teal.withOpacity(0.2),

                                  shape: BoxShape.circle,
                                ),

                                child: Icon(
                                  item['icon'],
                                  size: isSmallPhone ? 42 : 55,
                                  color: Colors.tealAccent,
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// TITLE
                              Text(
                                item['title'],
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: isSmallPhone ? 16 : 20,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 18),

                              /// BUTTON
                              Container(
                                width: double.infinity,

                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),

                                  border: Border.all(color: Colors.white24),
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: isSmallPhone ? 16 : 18,
                                    ),

                                    const SizedBox(width: 6),

                                    Text(
                                      "Open",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isSmallPhone ? 12 : 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
