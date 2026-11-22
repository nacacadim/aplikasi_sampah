import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF229B62);
    const darkGreen = Color(0xFF164B35);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'TrashFinder 🌱',
          style: TextStyle(
            color: darkGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Selamat Datang!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF229B62),
                    Color(0xFF164B35),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buang Sampah\nJadi Lebih Mudah!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Temukan tempat sampah terdekat\ndi sekitar lokasi kamu.',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Kategori Tempat Sampah',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                category(Icons.eco, 'Organik', Colors.green),
                category(Icons.recycling, 'Anorganik', Colors.blue),
                category(Icons.delete, 'Campuran', Colors.orange),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Mengapa TrashFinder?',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 15),

            infoCard(
              Icons.location_on,
              'Lokasi Terdekat',
              'Cari tempat sampah di sekitar kamu.',
            ),

            infoCard(
              Icons.map,
              'Google Maps',
              'Lihat lokasi tempat sampah melalui peta.',
            ),

            infoCard(
              Icons.eco,
              'Lingkungan Bersih',
              'Bantu menjaga kebersihan lingkungan.',
            ),
          ],
        ),
      ),

      bottomNavigationBar: const BottomNavbar(
        currentIndex: 0,
      ),
    );
  }

  Widget category(IconData icon, String title, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF229B62),
            size: 30,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}