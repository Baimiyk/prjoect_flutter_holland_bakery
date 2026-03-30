import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/product_card.dart';
import '../core/favorite_manager.dart';
import 'product.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProducts = _getStoreProducts()
        .where((p) => FavoriteManager.isFavorite(p['title']!))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Favorit",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Belum ada menu favorit",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Klik icon ❤️ di produk untuk menambahkan",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return ProductCard(
                    title: product['title']!,
                    price: product['price']!,
                    imagePath: product['image']!,
                    likes: '1.2K',
                    isFavorite: true,
                    onLikeTap: () {
                      FavoriteManager.toggle(product['title']!);
                      setState(() {});
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(
                            title: product['title']!,
                            price: product['price']!,
                            imagePath: product['image']!,
                          ),
                        ),
                      );
                    },
                    onAddTap: () {},
                  );
                },
              ),
            ),
    );
  }

  List<Map<String, String>> _getStoreProducts() {
    return [
      {
        'title': 'Cromboloni Sweet Cheese',
        'price': 'Rp 15.700',
        'image': 'assets/images/croke.jpg',
      },
      {
        'title': 'Danish Chocolate',
        'price': 'Rp 13.300',
        'image': 'assets/images/danco.jpg',
      },
      {
        'title': 'Danish Keju Apik',
        'price': 'Rp 15.800',
        'image': 'assets/images/danke.jpg',
      },
      {
        'title': 'Danish Raisin',
        'price': 'Rp 13.200',
        'image': 'assets/images/danrai.jpg',
      },
      {
        'title': 'Roti Mexican Coffee',
        'price': 'Rp 14.000',
        'image': 'assets/images/romeco.jpg',
      },
      {
        'title': 'Smoked Beef Cheese Loaf',
        'price': 'Rp 46.000',
        'image': 'assets/images/smobe.jpg',
      },
    ];
  }
}
