import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Variabel transparansi
  double _logoOpacity = 0.0; // Logo mulai dari tidak terlihat
  double _lottieOpacity = 1.0; // Animasi mulai dari terlihat jelas

  @override
  void initState() {
    super.initState();

    // Tahap 1: Biarkan animasi main dulu selama 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      // Cek mounted agar aman jika user keluar aplikasi sebelum 2 detik
      if (mounted) {
        setState(() {
          _logoOpacity = 1.0; // Logo perlahan MUNCUL
          _lottieOpacity =
              0.0; // Animasi perlahan HILANG (jadi background putih)
        });
      }
    });

    // Tahap 2: Pindah ke Login setelah transisi selesai (total sekitar 4.5 detik)
    Future.delayed(const Duration(milliseconds: 4500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tidak perlu MediaQuery lagi karena pakai SizedBox.expand

    return Scaffold(
      backgroundColor: Colors.white, // Background dasar putih
      body: Stack(
        // PERBAIKAN 2: Ini memastikan semua children yang tidak diposisikan khusus
        // akan berada tepat di tengah-tengah stack.
        alignment: Alignment.center,
        children: [
          // ================= LAYER 1: ANIMASI LOTTIE (BACKGROUND) =================
          // PERBAIKAN 1: Gunakan SizedBox.expand untuk memaksa memenuhi layar
          Center(
            // 1. Gunakan Widget Center (Bukan Positioned/SizedBox)
            child: AnimatedOpacity(
              opacity: _lottieOpacity,
              duration: const Duration(milliseconds: 1500),
              child: Transform.scale(
                scale:
                    1.2, // 2. Perbesar skala di sini jika kurang besar (misal 1.5 atau 2.0)
                child: Lottie.asset(
                  'assets/lottie/splash_circle.json',
                  // 3. Batasi lebar sesuai layar, tapi biarkan tingginya otomatis (aspect ratio asli)
                  width: MediaQuery.of(context).size.width,

                  // 4. PENTING: Gunakan 'contain' agar lingkarannya tidak terpotong
                  fit: BoxFit.contain,

                  // 5. Pastikan render dimulai dari tengah
                  alignment: Alignment.center,

                  delegates: LottieDelegates(
                    values: [
                      ValueDelegate.color([
                        '**',
                      ], value: const Color(0xFFFF5621)),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ================= LAYER 2: LOGO HOLLAND (FOREGROUND) =================
          AnimatedOpacity(
            opacity: _logoOpacity,
            duration: const Duration(milliseconds: 1500), // Durasi muncul
            curve: Curves.easeIn,
            // Column ini akan otomatis di tengah karena alignment Stack di atas
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Penting agar column tidak memenuhi tinggi layar
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width:
                      200, // PERBAIKAN 2: Ukuran logo diperkecil (sebelumnya 150)
                ),
                const SizedBox(height: 12), // Jarak sedikit dirapatkan
              ],
            ),
          ),
        ],
      ),
    );
  }
}
