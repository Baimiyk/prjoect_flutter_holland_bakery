import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _lottieOpacity = 1.0;
  double _logoOpacity = 0.0;
  double _logoOffsetX = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimationSequence();
  }

  void _startAnimationSequence() async {
    // TAHAP 1: Mainkan Lottie (Normal)
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    // TAHAP 2: Swap ke Logo
    setState(() {
      _lottieOpacity = 0.0;
      _logoOpacity = 1.0;
    });

    // TAHAP 3: Tunggu Logo Muncul (Normal 1 detik)
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;

    // TAHAP 4: LOGO GESER KIRI
    setState(() {
      _logoOffsetX = -MediaQuery.of(context).size.width;
    });

    // TAHAP 5: TUNGGU GESER SELESAI (KUNCI DI SINI)
    // Logo butuh 500ms untuk geser. Kita tunggu pas 500ms.
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    // TAHAP 6: MASUK LOGIN TANPA JEDA
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),

        // PERBAIKAN: SET DURASI KE 0 (INSTAN)
        // Kita tidak pakai FadeTransition lagi.
        // Begitu logo hilang, Login Screen langsung MUNCUL (SNAP).
        // Ini menghilangkan jeda layar putih kosong.
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,

        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Tidak perlu animasi apa-apa, langsung return child
          return child;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // LAYER 1: LOTTIE
          Center(
            child: AnimatedOpacity(
              opacity: _lottieOpacity,
              duration: const Duration(milliseconds: 1000),
              child: Transform.scale(
                scale: 1.2,
                child: Lottie.asset(
                  'assets/lottie/splash_circle.json',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
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

          // LAYER 2: LOGO
          AnimatedTranslation(
            offsetX: _logoOffsetX,
            // Durasi Geser Fisik: 500ms (Cukup Cepat & Smooth)
            duration: const Duration(milliseconds: 500),
            child: AnimatedOpacity(
              opacity: _logoOpacity,
              duration: const Duration(milliseconds: 1000),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo.png', width: 200),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper Widget
class AnimatedTranslation extends StatelessWidget {
  final Widget child;
  final double offsetX;
  final Duration duration;

  const AnimatedTranslation({
    super.key,
    required this.child,
    required this.offsetX,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: offsetX),
      duration: duration,
      curve: Curves.easeInOutCubic,
      builder: (context, value, child) {
        return Transform.translate(offset: Offset(value, 0), child: child);
      },
      child: child,
    );
  }
}
