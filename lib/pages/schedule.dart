import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  final List<String> monthNames = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  final List<String> dayNames = [
    "Sen",
    "Sel",
    "Rab",
    "Kam",
    "Jum",
    "Sab",
    "Min",
  ];

  /// DUMMY EVENT INDONESIA
  final List<Map<String, dynamic>> events = [
    {
      "day": 1,
      "month": 1,
      "title": "Tahun Baru",
      "color": Colors.red,
      "icon": Icons.celebration,
    },

    {
      "day": 14,
      "month": 2,
      "title": "Hari Kasih Sayang",
      "color": Colors.pink,
      "icon": Icons.favorite,
    },

    {
      "day": 17,
      "month": 8,
      "title": "Hari Kemerdekaan",
      "color": Colors.orange,
      "icon": Icons.flag,
    },

    {
      "day": 25,
      "month": 12,
      "title": "Hari Natal",
      "color": Colors.green,
      "icon": Icons.church,
    },
  ];

  int getDaysInMonth(int month, int year) {
    return DateTime(year, month + 1, 0).day;
  }

  int getFirstDayOfMonth(int month, int year) {
    int weekday = DateTime(year, month, 1).weekday;
    return weekday == 7 ? 0 : weekday;
  }

  @override
  Widget build(BuildContext context) {
    int totalDays = getDaysInMonth(selectedMonth, selectedYear);
    int firstDay = getFirstDayOfMonth(selectedMonth, selectedYear);

    return Scaffold(
      backgroundColor: const Color(0xff071426),

      appBar: AppBar(
        backgroundColor: const Color(0xff071426),
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Kalender Indonesia",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [
          /// HEADER BULAN & TAHUN
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: const Color(0xff102033),
              borderRadius: BorderRadius.circular(25),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedMonth--;

                      if (selectedMonth < 1) {
                        selectedMonth = 12;
                        selectedYear--;
                      }
                    });
                  },

                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),

                Column(
                  children: [
                    Text(
                      monthNames[selectedMonth - 1],
                      style: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "$selectedYear",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                IconButton(
                  onPressed: () {
                    setState(() {
                      selectedMonth++;

                      if (selectedMonth > 12) {
                        selectedMonth = 1;
                        selectedYear++;
                      }
                    });
                  },

                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          /// NAMA HARI
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),

            child: Row(
              children: dayNames.map((day) {
                return Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 10),

          /// KALENDER
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),

              itemCount: totalDays + firstDay,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),

              itemBuilder: (context, index) {
                if (index < firstDay) {
                  return const SizedBox();
                }

                int day = index - firstDay + 1;

                Map<String, dynamic>? event;

                try {
                  event = events.firstWhere(
                    (e) => e['day'] == day && e['month'] == selectedMonth,
                  );
                } catch (e) {
                  event = null;
                }

                bool isToday =
                    day == DateTime.now().day &&
                    selectedMonth == DateTime.now().month &&
                    selectedYear == DateTime.now().year;

                return GestureDetector(
                  onTap: () {
                    if (event != null) {
                      showDialog(
                        context: context,

                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color(0xff102033),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),

                            title: Row(
                              children: [
                                Icon(event!['icon'], color: event['color']),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Text(
                                    event['title'],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),

                            content: Text(
                              "$day ${monthNames[selectedMonth - 1]} $selectedYear",
                              style: const TextStyle(color: Colors.white70),
                            ),

                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },

                                child: const Text(
                                  "Tutup",
                                  style: TextStyle(color: Colors.tealAccent),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },

                  child: Container(
                    decoration: BoxDecoration(
                      color: isToday
                          ? Colors.teal
                          : event != null
                          ? event['color'].withOpacity(0.25)
                          : const Color(0xff102033),

                      borderRadius: BorderRadius.circular(18),

                      border: Border.all(
                        color: event != null ? event['color'] : Colors.white10,
                        width: 1.5,
                      ),
                    ),

                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "$day",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        if (event != null)
                          Positioned(
                            top: 5,
                            right: 5,

                            child: Icon(
                              event['icon'],
                              color: event['color'],
                              size: 14,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
