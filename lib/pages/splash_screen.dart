import 'dart:async';
import 'package:apliasi_doa/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// PINDAH KE HOMEPAGE
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff071426),

      body: Stack(
        children: [
          /// CIRCLE ATAS
          /// CIRCLE ATAS
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 240,
              height: 240,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                gradient: RadialGradient(
                  colors: [
                    Colors.tealAccent.withOpacity(0.45),
                    Colors.teal.withOpacity(0.18),
                    Colors.transparent,
                  ],
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.tealAccent.withOpacity(0.35),
                    blurRadius: 80,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),

          /// CIRCLE BAWAH
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 280,
              height: 280,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                gradient: RadialGradient(
                  colors: [
                    Color(0xff5CE1E6).withOpacity(0.35),
                    Colors.teal.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.30),
                    blurRadius: 90,
                    spreadRadius: 25,
                  ),
                ],
              ),
            ),
          ),

          /// ISI TENGAH
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// LOGO BULAT
                const SizedBox(height: 35),

                /// TEXT LOGO
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Hamm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextSpan(
                        text: "❤",
                        style: TextStyle(color: Colors.redAccent, fontSize: 28),
                      ),

                      TextSpan(
                        text: "ra",
                        style: TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// SUBTITLE
                const Text(
                  "Daily Prayer Companion",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 40),

                /// LOADING
                const CircularProgressIndicator(color: Colors.tealAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
