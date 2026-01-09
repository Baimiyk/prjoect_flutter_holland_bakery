import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Tinggi header
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ), // Jarak kiri-kanan
          decoration: BoxDecoration(
            color: Colors.white,
            // SHADOW CONFIGURATION
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(
                  0.4,
                ), // Warna bayangan (abu-abu halus)
                spreadRadius: 1, // Sebaran bayangan
                blurRadius: 5, // Tingkat kehalusan (blur)
                offset: const Offset(0, 3), // Geser bayangan ke bawah (3px)
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Teks di tengah vertikal
              crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
              children: [
                Text(
                  "Account",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Tebal sesuai gambar
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================== 1. PROFILE HEADER ==================
            Row(
              children: [
                // Foto Profil Bulat
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color(
                      0xFFE57373,
                    ), // Warna pink/merah muda placeholder
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                  // Nanti bisa diganti: backgroundImage: AssetImage('assets/images/user.jpg'),
                ),
                const SizedBox(width: 15),

                // Info User (Nama, Email, No HP)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fufufafa",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "fufa123@gmail.com",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "+6212345678",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // Icon Edit (Pensil)
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 20, color: Colors.black),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ================== 2. MENU SECTION: ADDRESSES ==================
            _buildSectionTitle("Addresses"),
            _buildMenuItem(
              icon: Icons.home_outlined,
              title: "Manage Addresses",
              onTap: () {},
            ),

            const SizedBox(height: 20),

            // ================== 3. MENU SECTION: REWARDS ==================
            _buildSectionTitle("Rewards"),
            _buildMenuItem(
              icon: Icons.verified_outlined, // Icon mirip badge rewards
              title: "My Points",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.local_activity_outlined, // Icon tiket/kupon
              title: "My Coupons",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.card_giftcard_outlined,
              title: "Gift Coupons",
              onTap: () {},
            ),

            const SizedBox(height: 20),

            // ================== 4. MENU SECTION: INFORMATIONS ==================
            _buildSectionTitle("Informations"),
            _buildMenuItem(
              icon: Icons.description_outlined,
              title: "Terms and Condition",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.privacy_tip_outlined, // Icon perisai/privacy
              title: "Privacy Policy",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: "FAQ",
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.chat_bubble_outline,
              title: "Contact Us",
              onTap: () {},
              showDivider: false, // Item terakhir tidak perlu garis bawah
            ),

            // Tombol Logout (Opsional, biasanya ada di bawah)
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Logic logout nanti di sini
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFF5621)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Log Out",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFFF5621),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget Helper untuk Judul Section (Warna Merah/Orange)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: const Color(0xFFFF5621), // Warna Orange Holland
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  // Widget Helper untuk Item Menu (Icon + Teks + Garis Bawah)
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero, // Hilangkan padding bawaan ListTile
          leading: Icon(icon, color: Colors.black, size: 26),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight:
                  FontWeight.w600, // Semi-bold agar tegas seperti desain
              color: Colors.black,
            ),
          ),
          minLeadingWidth: 20, // Rapatkan jarak icon ke teks
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFEEEEEE),
          ), // Garis tipis abu-abu
      ],
    );
  }
}
