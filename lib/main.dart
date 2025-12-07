import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Pastikan package ini ada di pubspec.yaml
import 'screens/dashboard.dart'; // Import halaman dashboard

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner 'Debug'
      title: 'Holland Bakery UI',
      theme: ThemeData(
        useMaterial3: true,
        // Set font global jadi Poppins (opsional, biar mirip desain)
        textTheme: GoogleFonts.poppinsTextTheme(),
        // Warna primary default
        primarySwatch: Colors.orange,
      ),
      home: const Dashboard(), // Panggil Dashboard di sini
    );
  }
}
