import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/header.dart';
import '../widgets/search_bar.dart';
import '../widgets/membership_card.dart';
import '../widgets/promo_banner.dart';
import '../widgets/store.dart';

// Import Screen Tujuan
import 'product.dart';
import 'store.dart'; // Pastikan Anda sudah membuat file ini, atau sesuaikan namanya

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      // Menggunakan SafeArea agar tidak tertutup notch HP
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ================== 1. HEADER ==================
            const SliverToBoxAdapter(
              child: DashboardHeader(
                userName: "Fufufafa",
                location: "Jl. Prof. Soedarto, Tembalang",
              ),
            ),

            // ================== 2. SEARCH BAR ==================
            SliverPersistentHeader(pinned: true, delegate: SearchBarDelegate()),

            // ================== 3. KONTEN (Membership, Promo, Toko) ==================
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
                  Divider(color: Colors.grey.shade300, thickness: 3, height: 3),
                  const SizedBox(height: 15),

                  const Text(
                    "Stores Nearby",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
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
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (
                                context,
                                animation,
                                secondaryAnimation,
                              ) => const StoreScreen(
                                storeName:
                                    "Holland Bakery Banyumanik", // Sesuaikan nama tokonya
                                storeAddress: "Ruko Taman Setiabudi A4...",
                                storeInfo: "3.2 km | 12-25 mins",
                                storeRating: "4.9",
                                storeImage: "assets/images/store.png",
                              ),

                          // 1. DURASI DIPERLAMBAT (800ms)
                          transitionDuration: const Duration(milliseconds: 800),
                          reverseTransitionDuration: const Duration(
                            milliseconds: 800,
                          ), // Saat kembali juga smooth

                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0); // Dari Kanan
                                const end = Offset.zero;

                                // 2. KURVA LEBIH LEMBUT (Smooth Start & End)
                                // easeInOutCubic memberikan efek "mengayun" yang sangat halus
                                const curve = Curves.easeInOutCubic;

                                var tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  // Store 2
                  Store(
                    name: "Holland Bakery Kedung Mundu",
                    address: "Gaia Residence Semarang Ruko",
                    info: "5.5 km | 12-40 mins",
                    rating: "4.9",
                    imagePath: "assets/images/store.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (
                                context,
                                animation,
                                secondaryAnimation,
                              ) => const StoreScreen(
                                storeName:
                                    "Holland Bakery Banyumanik", // Sesuaikan nama tokonya
                                storeAddress: "Ruko Taman Setiabudi A4...",
                                storeInfo: "3.2 km | 12-25 mins",
                                storeRating: "4.9",
                                storeImage: "assets/images/store.png",
                              ),

                          // 1. DURASI DIPERLAMBAT (800ms)
                          transitionDuration: const Duration(milliseconds: 800),
                          reverseTransitionDuration: const Duration(
                            milliseconds: 800,
                          ), // Saat kembali juga smooth

                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0); // Dari Kanan
                                const end = Offset.zero;

                                // 2. KURVA LEBIH LEMBUT (Smooth Start & End)
                                // easeInOutCubic memberikan efek "mengayun" yang sangat halus
                                const curve = Curves.easeInOutCubic;

                                var tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),

                  Divider(color: Colors.grey.shade300, thickness: 3, height: 3),
                  const SizedBox(height: 1),
                ]),
              ),
            ),

            // ================== 4. GRID PRODUK ==================
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
                    // Navigasi ke Detail Produk
                    onTap: () {
                      // ANIMASI TRANSISI: SLIDE DARI BAWAH (Slide Up)
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProductDetailScreen(
                                    title: product['title']!,
                                    price: product['price']!,
                                    imagePath: product['image']!,
                                  ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(
                                  0.0,
                                  1.0,
                                ); // Muncul dari Bawah
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                var tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                          transitionDuration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    onLikeTap: () {},
                    onAddTap: () {},
                  );
                }, childCount: 6),
              ),
            ),

            // Padding bawah agar item terakhir tidak tertutup layar
            const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
          ],
        ),
      ),
    );
  }

  // Data Dummy Produk
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
