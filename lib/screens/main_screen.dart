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
      // BODY akan berubah sesuai index yang dipilih
      body: _pages[_selectedIndex],

      // BOTTOM NAVIGATION BAR memanggil widget Custom yang kita buat
      bottomNavigationBar: CustomBottomNav(
        selectedIndex:
            _selectedIndex, // Kirim info: "Tombol nomor berapa yang harus oranye?"
        onTap: _onItemTapped, // Kirim fungsi: "Apa yang terjadi kalau diklik?"
      ),
    );
  }
}
