import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart'; // Import Navbar buatan kita
import 'dashboard.dart';
import 'account_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Menyimpan status halaman mana yang aktif (0 = Home)

  // Daftar halaman yang akan ditampilkan bergantian
  final List<Widget> _pages = [
    const DashboardScreen(), // Index 0: Tampilkan Dashboard yang sudah dibuat
    const Center(child: Text("Halaman Promo")), // Index 1: Dummy Promo
    const Center(child: Text("Halaman Orders")), // Index 2: Dummy Orders
    const AccountScreen(), // Index 3: Dummy Account
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update state agar warna tombol berubah
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true, // Agar navbar rounded terlihat transparan
      // GANTI BODY BIASA DENGAN ANIMATED SWITCHER
      body: AnimatedSwitcher(
        // 1. Durasi transisi (400ms sangat pas untuk fade)
        duration: const Duration(milliseconds: 400),

        // 2. Jenis Animasi: Fade (Bisa diganti Scale jika mau)
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              // Zoom in sangat halus dari 98% ke 100%
              scale: Tween<double>(begin: 0.98, end: 1.0).animate(animation),
              child: child,
            ),
          );
        },

        // 3. PENTING: Bungkus halaman dengan Container yang punya Key
        // Key ini memberitahu Flutter bahwa "Isinya sudah berubah, tolong dianimasikan!"
        child: Container(
          key: ValueKey<int>(_selectedIndex), // Key berubah sesuai index tab
          color: Colors.white, // Pastikan ada background agar transisi rapi
          child: _pages[_selectedIndex],
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
