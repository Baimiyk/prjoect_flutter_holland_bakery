// widgets/store.dart
import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  final String name;
  final String address; // ← BARU
  final String info;
  final String rating;
  final String imagePath;
  final VoidCallback? onTap;

  const Store({
    super.key,
    required this.name,
    required this.address,
    required this.info,
    required this.rating,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap ?? () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
          ), // biar ada jarak atas-bawah
          child: Row(
            children: [
              // Store Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 80,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              // Store Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      address, // ← info jalan
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color.fromARGB(255, 113, 113, 113),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      info,
                      style: const TextStyle(fontSize: 11, color: Color.fromARGB(255, 113, 113, 113)),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
