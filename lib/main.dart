import 'package:flutter/material.dart';
// Nanti kita import halaman dashboard di sini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Menghilangkan pita "Debug" di pojok kanan atas
      title: 'Dashboard UI',
      theme: ThemeData(
        useMaterial3: true,
        // Nanti kita atur warna dan font di sini
      ),
      home: const Scaffold(body: Center(child: Text("Siap untuk Coding!"))),
    );
  }
}
