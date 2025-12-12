import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String imagePath;
  final double height;
  final VoidCallback? onTap;

  const PromoBanner({
    super.key,
    required this.imagePath,
    this.height = 140,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap ?? () {},
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}