import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/header.dart';
import '../widgets/search_bar.dart';
import '../widgets/membership_card.dart';
import '../widgets/promo_banner.dart';
import '../widgets/store.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            const DashboardHeader(
              userName: "Fufufafa",
              location: "Jl. Prof. Soedarto, Tembalang",
            ),

            // Search Bar
            SliverPersistentHeader(pinned: true, delegate: SearchBarDelegate()),

            // Content
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Membership & Coupon Card
                  const MembershipCard(
                    membershipLevel: "Silver",
                    points: "0 point",
                  ),
                  const SizedBox(height: 12),

                  // Promo Banner
                  const PromoBanner(imagePath: "assets/images/promo1.png"),
                  const SizedBox(height: 15),

                  // === STORES NEARBY SECTION ===

                  // Garis pembatas atas (dari ujung ke ujung)
                  Divider(color: Colors.grey.shade300, thickness: 3, height: 3),
                  const SizedBox(height: 15),

                  // Judul "Stores Nearby" — tebal banget
                  const Text(
                    "Stores Nearby",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900, // paling tebal!
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Store 1
                  Store(
                    name: "Holland Bakery Banyumanik",
                    address: "Ruko Taman Setiabudi A4",
                    info: "3.2 km | 12-25 mins",
                    rating: "4.9",
                    imagePath: "assets/images/store.png",
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),

                  // Store 2
                  Store(
                    name: "Holland Bakery Kedung Mundu",
                    address: "Gaia Residence Semarang Ruko",
                    info: "5.5 km | 12-40 mins",
                    rating: "4.9",
                    imagePath: "assets/images/store.png",
                    onTap: () {},
                  ),
                  const SizedBox(height: 15),

                  // Garis pembatas bawah (dari ujung ke ujung)
                  Divider(color: Colors.grey.shade300, thickness: 3, height: 3),
                  const SizedBox(height: 1),
                ]),
              ),
            ),

            // Product Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final products = _getProducts();
                  final product = products[index];

                  return ProductCard(
                    title: product['title']!,
                    price: product['price']!,
                    imagePath: product['image']!,
                    likes: "3k likes",
                    onTap: () {},
                    onLikeTap: () {},
                    onAddTap: () {},
                  );
                }, childCount: 6),
              ),
            ),

            const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(selectedIndex: 0, onTap: (index) {}),
    );
  }

  List<Map<String, String>> _getProducts() {
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
