import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../widgets/header.dart';
import '../widgets/search_bar.dart';
import '../widgets/membership_card.dart';
import '../widgets/promo_banner.dart';
import '../widgets/store.dart';
import '../core/favorite_manager.dart';
import 'product.dart';
import 'store.dart';
import 'favorites_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ================== 1. HEADER ==================
            SliverToBoxAdapter(
              child: DashboardHeader(
                userName: "Fufufafa",
                location: "Jl. Prof. Soedarto, Tembalang",
              ),
            ),

            // ================== 2. SEARCH BAR ==================
            SliverPersistentHeader(
              pinned: true,
              delegate: SearchBarDelegate(
                onFavoriteTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FavoritesScreen()),
                  );
                },
              ),
            ),

            // ================== 3. KONTEN ==================
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const MembershipCard(
                    membershipLevel: "Silver",
                    points: "0 point",
                  ),
                  const SizedBox(height: 12),

                  const PromoBanner(imagePath: "assets/images/promo1.png"),
                  const SizedBox(height: 15),

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
                                storeName: "Holland Bakery Banyumanik",
                                storeAddress:
                                    "Ruko Taman Setiabudi A4, Srondol Wetan, Wetan Kec. Banyumanik, Kota Semarang, Jawa Tengah 50263",
                                storeInfo: "3.2 km | 12-25 mins",
                                storeRating: "4.9",
                                storeImage: "assets/images/store.png",
                              ),
                          transitionDuration: const Duration(milliseconds: 800),
                          reverseTransitionDuration: const Duration(
                            milliseconds: 800,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
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
                                storeName: "Holland Bakery Kedung Mundu",
                                storeAddress:
                                    "Gaia Residence Semarang Ruko, Kedung Mundu, Kota Semarang, Jawa Tengah",
                                storeInfo: "5.5 km | 12-40 mins",
                                storeRating: "4.9",
                                storeImage: "assets/images/store.png",
                              ),
                          transitionDuration: const Duration(milliseconds: 800),
                          reverseTransitionDuration: const Duration(
                            milliseconds: 800,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
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
                ]),
              ),
            ),

            // ================== 4. GRID PRODUK (BISA FAVORIT) ==================
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
                    isFavorite: FavoriteManager.isFavorite(product['title']!),
                    onLikeTap: () {
                      FavoriteManager.toggle(product['title']!);
                      setState(() {});
                    },
                    onTap: () {
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
                                const begin = Offset(0.0, 1.0);
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
                    onAddTap: () {},
                  );
                }, childCount: 6),
              ),
            ),

            const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
          ],
        ),
      ),
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
