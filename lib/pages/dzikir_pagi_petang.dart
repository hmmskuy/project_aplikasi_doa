import 'package:apliasi_doa/kumpulan%20dzikir%20pagi%20dan%20petang/dzikir_petang.dart';
import 'package:apliasi_doa/pages/schedule.dart';
import 'package:apliasi_doa/service/profile.dart';
import 'package:flutter/material.dart';

import 'package:apliasi_doa/homepage.dart';
import 'package:apliasi_doa/kumpulan dzikir pagi dan petang/dzikir_pagi.dart';

class DzikirPagiPetang extends StatelessWidget {
  const DzikirPagiPetang({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> doaList = ["Dzikir Pagi", "Dzikir Petang"];

    return Scaffold(
      backgroundColor: const Color(0xff0F172A),

      /// APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xff0F172A),
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),

          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),

        title: const Text(
          "Dzikir Pagi dan Petang",

          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      /// BODY
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [Color(0xff0F172A), Color(0xff111827), Color(0xff1E293B)],
          ),
        ),

        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: doaList.length,

          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                /// DZIKIR PAGI
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DzikirPagi()),
                  );
                }
                /// DZIKIR PETANG
                else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DzikirPetang(),
                    ),
                  );
                }
              },

              child: Container(
                margin: const EdgeInsets.only(bottom: 18),
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),

                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Colors.white.withOpacity(0.08),
                      Colors.white.withOpacity(0.03),
                    ],
                  ),

                  border: Border.all(color: Colors.white.withOpacity(0.08)),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    /// ICON
                    Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: const Color(0xff4ADE80).withOpacity(0.15),

                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: const Icon(
                        Icons.circle,
                        color: Color(0xff4ADE80),
                        size: 18,
                      ),
                    ),

                    const SizedBox(width: 16),

                    /// TITLE
                    Expanded(
                      child: Text(
                        doaList[index],

                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    /// ARROW
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.white54,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff111827),

        currentIndex: 2,
        selectedItemColor: const Color(0xff4ADE80),
        unselectedItemColor: Colors.white54,

        onTap: (index) {
          /// HOME
          if (index == 0) {
            // halaman home
          }
          /// SCHEDULE
          else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Schedule()),
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

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
