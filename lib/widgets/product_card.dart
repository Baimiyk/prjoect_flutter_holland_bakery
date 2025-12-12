// product_card.dart → VERSI SESUAI PERMINTAANMU (title & harga fleksibel, likes tetap di bawah)

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;
  final String likes;
  final VoidCallback? onTap;
  final VoidCallback? onLikeTap;
  final VoidCallback? onAddTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.likes,
    this.onTap,
    this.onLikeTap,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              // GAMBAR
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  imagePath,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // INFO SECTION
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TITLE — fleksibel, max 3 baris
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 1.3,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 6),

                      // HARGA — posisinya mengikuti title secara alami
                      Text(
                        price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF222222),
                        ),
                      ),

                      // Dorong likes ke paling bawah
                      const Spacer(),

                      // LIKES + TOMBOL ADD — selalu di paling bawah
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: onLikeTap,
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Color(0xFFFF5621),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                likes,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),

                          Material(
                            color: const Color(0xFFFF5621),
                            shape: const CircleBorder(),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: onAddTap,
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}