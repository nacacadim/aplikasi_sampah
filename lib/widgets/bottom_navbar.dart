import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/map_page.dart';
import '../pages/admin_login_page.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
  });

  void navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget page;

    if (index == 0) {
      page = const HomePage();
    } else if (index == 1) {
      page = const MapPage();
    } else {
      page = const AdminLoginPage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => navigate(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF229B62),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_rounded),
          label: 'Peta',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.admin_panel_settings_rounded),
          label: 'Admin',
        ),
      ],
    );
  }
}