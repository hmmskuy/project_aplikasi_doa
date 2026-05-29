import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// =======================================
/// HALAMAN TENTANG APLIKASI
/// =======================================

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallPhone = screenWidth < 360;

    return Scaffold(
      backgroundColor: const Color(0xff071426),

      appBar: AppBar(
        backgroundColor: const Color(0xff071426),
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Tentang Aplikasi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallPhone ? 16 : 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// ICON
            Center(
              child: Container(
                width: isSmallPhone ? 120 : 150,
                height: isSmallPhone ? 120 : 150,

                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  Icons.menu_book_rounded,
                  color: Colors.tealAccent,
                  size: isSmallPhone ? 60 : 80,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// TITLE
            Center(
              child: Text(
                "Aplikasi Doa Islami",
                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallPhone ? 24 : 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// CARD PENJELASAN
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: const Color(0xff102033),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.info_outline,
                        color: Colors.tealAccent,
                        size: 28,
                      ),

                      SizedBox(width: 10),

                      Text(
                        "Tentang Aplikasi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Aplikasi ini dibuat untuk membantu umat muslim dalam melakukan ibadah sehari-hari dengan lebih mudah dan modern.",

                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: isSmallPhone ? 14 : 16,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    "Di dalam aplikasi tersedia berbagai fitur seperti kumpulan doa, dzikir harian, jadwal sholat, reminder adzan, dan fitur islami lainnya.",

                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: isSmallPhone ? 14 : 16,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    "Aplikasi ini dikembangkan menggunakan Flutter dengan desain modern, responsive, dan nyaman digunakan di semua perangkat.",

                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: isSmallPhone ? 13 : 15,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// FITUR
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                color: const Color(0xff102033),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Fitur Aplikasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  buildFeature(Icons.menu_book, "Kumpulan Doa"),
                  buildFeature(Icons.access_time, "Jadwal Sholat"),
                  buildFeature(Icons.notifications_active, "Reminder Adzan"),
                  buildFeature(Icons.favorite, "Favorite Doa"),
                  buildFeature(Icons.self_improvement, "Dzikir Harian"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeature(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),

            child: Icon(icon, color: Colors.tealAccent, size: 24),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================================
/// PROFILE PAGE
/// =======================================

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /// CONTROLLER
  final TextEditingController nameController = TextEditingController(
    text: "Hamm❤️ra",
  );

  final TextEditingController emailController = TextEditingController(
    text: "hammam@gmail.com",
  );

  final TextEditingController bioController = TextEditingController(
    text: "Muslim Developer",
  );

  /// IMAGE
  File? profileImage;

  /// IMAGE PICKER
  final ImagePicker picker = ImagePicker();

  /// PICK IMAGE
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source, imageQuality: 80);

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  /// BOTTOM SHEET PILIH FOTO
  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff102033),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),

      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const Text(
                "Pilih Foto Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.tealAccent),

                title: const Text(
                  "Kamera",
                  style: TextStyle(color: Colors.white),
                ),

                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),

              ListTile(
                leading: const Icon(Icons.photo, color: Colors.tealAccent),

                title: const Text(
                  "Galeri",
                  style: TextStyle(color: Colors.white),
                ),

                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// EDIT PROFILE
  void editProfile() {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xff102033),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),

          title: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                /// NAME
                TextField(
                  controller: nameController,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    labelText: "Nama",
                    labelStyle: const TextStyle(color: Colors.white70),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),

                      borderSide: const BorderSide(color: Colors.white24),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),

                      borderSide: const BorderSide(color: Colors.tealAccent),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// EMAIL
                TextField(
                  controller: emailController,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(color: Colors.white70),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),

                      borderSide: const BorderSide(color: Colors.white24),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),

                      borderSide: const BorderSide(color: Colors.tealAccent),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// BIO
                TextField(
                  controller: bioController,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    labelText: "Bio",
                    labelStyle: const TextStyle(color: Colors.white70),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),

                      borderSide: const BorderSide(color: Colors.white24),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),

                      borderSide: const BorderSide(color: Colors.tealAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                "Batal",
                style: TextStyle(color: Colors.redAccent),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),

              onPressed: () {
                setState(() {});
                Navigator.pop(context);
              },

              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    /// RESPONSIVE
    double screenWidth = MediaQuery.of(context).size.width;

    bool isSmallPhone = screenWidth < 360;

    return Scaffold(
      backgroundColor: const Color(0xff071426),

      appBar: AppBar(
        backgroundColor: const Color(0xff071426),
        elevation: 0,
        centerTitle: true,

        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        iconTheme: const IconThemeData(color: Colors.white),

        actions: [
          IconButton(
            onPressed: editProfile,

            icon: const Icon(Icons.edit, color: Colors.tealAccent),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(isSmallPhone ? 14 : 20),

        child: Column(
          children: [
            /// FOTO PROFILE
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    border: Border.all(color: Colors.tealAccent, width: 3),
                  ),

                  child: CircleAvatar(
                    radius: isSmallPhone ? 50 : 60,
                    backgroundColor: Colors.grey.shade800,

                    backgroundImage: profileImage != null
                        ? FileImage(profileImage!)
                        : null,

                    child: profileImage == null
                        ? Icon(
                            Icons.person,
                            size: isSmallPhone ? 50 : 60,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),

                /// BUTTON CAMERA
                Positioned(
                  bottom: 0,
                  right: 0,

                  child: GestureDetector(
                    onTap: showImagePicker,

                    child: Container(
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,

                        border: Border.all(color: Colors.white, width: 2),
                      ),

                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// NAMA
            Text(
              nameController.text,
              textAlign: TextAlign.center,

              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallPhone ? 24 : 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            /// EMAIL
            Text(
              emailController.text,
              textAlign: TextAlign.center,

              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: isSmallPhone ? 14 : 16,
              ),
            ),

            const SizedBox(height: 12),

            /// BIO
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                bioController.text,

                style: TextStyle(
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: isSmallPhone ? 12 : 14,
                ),
              ),
            ),

            const SizedBox(height: 35),

            /// STATISTIK
            Row(
              children: [
                Expanded(
                  child: buildStatCard(
                    icon: Icons.menu_book,
                    title: "Doa",
                    value: "120",
                    isSmallPhone: isSmallPhone,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: buildStatCard(
                    icon: Icons.self_improvement,
                    title: "Dzikir",
                    value: "89",
                    isSmallPhone: isSmallPhone,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: buildStatCard(
                    icon: Icons.favorite,
                    title: "Favorite",
                    value: "25",
                    isSmallPhone: isSmallPhone,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: buildStatCard(
                    icon: Icons.notifications_active,
                    title: "Reminder",
                    value: "ON",
                    isSmallPhone: isSmallPhone,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            /// BUTTON TENTANG APLIKASI
            InkWell(
              borderRadius: BorderRadius.circular(25),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutAppPage()),
                );
              },

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff2BC0C8), Color(0xff0F2027)],
                  ),

                  borderRadius: BorderRadius.circular(25),
                ),

                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),

                      decoration: BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),

                      child: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: isSmallPhone ? 26 : 30,
                      ),
                    ),

                    const SizedBox(width: 18),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Tentang Aplikasi",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallPhone ? 18 : 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            "Klik untuk melihat penjelasan aplikasi",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: isSmallPhone ? 12 : 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CARD STAT
  Widget buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required bool isSmallPhone,
  }) {
    return Container(
      padding: EdgeInsets.all(isSmallPhone ? 16 : 20),

      decoration: BoxDecoration(
        color: const Color(0xff102033),

        borderRadius: BorderRadius.circular(25),

        border: Border.all(color: Colors.white10),
      ),

      child: Column(
        children: [
          Icon(icon, color: Colors.tealAccent, size: isSmallPhone ? 28 : 35),

          const SizedBox(height: 15),

          Text(
            value,

            style: TextStyle(
              color: Colors.white,
              fontSize: isSmallPhone ? 20 : 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.white70,
              fontSize: isSmallPhone ? 13 : 16,
            ),
          ),
        ],
      ),
    );
  }
}
