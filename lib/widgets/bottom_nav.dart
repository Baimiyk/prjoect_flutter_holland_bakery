import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    this.selectedIndex = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dekorasi bayangan diletakkan di container pelindung
      decoration: BoxDecoration(
        color: Colors.transparent, // Background transparan agar shadow terlihat
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 10,
            offset: const Offset(0, -5), // Bayangan ke atas
          ),
        ],
      ),
      // ClipRRect bertugas memotong sudut menjadi melengkung
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ), // Lengkungan 30px
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          // Warna saat aktif (Orange)
          selectedItemColor: const Color(0xFFFF5621),
          // Warna saat tidak aktif (Abu-abu)
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: "Promo",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
