import 'package:flutter/material.dart';
// Import widget buatan kita
import '../widgets/product_card.dart';
import '../widgets/bottom_nav.dart'; // Pastikan nama file ini sesuai

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HEADER =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi, Fufufafa!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0xFFFF5621),
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Jl. Prof. Soedarto, Tembalang",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Keranjang bisa diklik
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Color(0xFFFF5621),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Notifikasi bisa diklik
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Color(0xFFFF5621),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ================= SEARCH BAR =================
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      // ← BUNGKUS DI SINI
                      borderRadius: BorderRadius.circular(
                        30,
                      ), // biar ripple ikut sudut
                      onTap: () {},
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 10),
                            Text(
                              "Search for stores and cakes",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ), // ← TUTUP DI SINI
                  ),
                  const SizedBox(width: 10),
                  // Icon hati bisa diklik
                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFFF5621)),
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Color(0xFFFF5621),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ================= MEMBERSHIP & COUPON =================
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    // BAGIAN KIRI: SILVER (bisa diklik sendiri)
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.stars, color: Colors.green),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Silver",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "0 point",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFFFF5621),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Garis pemisah
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey.shade300,
                    ),

                    // BAGIAN KANAN: GIFT COUPON (bisa diklik sendiri)
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          // nanti bisa buka halaman coupon
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.card_giftcard, color: Colors.green),
                              SizedBox(width: 8),
                              Text(
                                "Gift Coupon",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= BANNER =================
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/promo1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ================= STORES NEARBY =================
              const Text(
                "Stores Nearby",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildStoreItem(
                context,
                "Holland Bakery Banyumanik",
                "3.2 km | 12-25 mins",
                "4.8",
              ),
              const SizedBox(height: 15),
              _buildStoreItem(
                context,
                "Holland Bakery Kedung Mundu",
                "5.5 km | 12-40 mins",
                "4.6",
              ),

              const SizedBox(height: 25),

              // ================= PRODUCT GRID =================
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final titles = [
                    "Cromboloni Sweet Cheese",
                    "Danish Chocolate",
                    "Danish Keju Apik",
                    "Danish Raisin",
                    "Roti Mexican Coffee",
                    "Smoked Beef Cheese",
                  ];
                  final prices = [
                    "Rp 13.700",
                    "Rp 13.700",
                    "Rp 15.800",
                    "Rp 13.200",
                    "Rp 14.000",
                    "Rp 46.000",
                  ];
                  final images = [
                    "assets/images/croke.jpg",
                    "assets/images/danco.jpg",
                    "assets/images/danke.jpg",
                    "assets/images/danrai.jpg",
                    "assets/images/romeco.jpg",
                    "assets/images/smobe.jpg",
                  ];

                  return ProductCard(
                    title: titles[index],
                    price: prices[index],
                    imagePath: images[index],
                    likes: "3k likes",
                  );
                },
              ),

              const SizedBox(height: 80), // biar ga ketutup navbar
            ],
          ),
        ),
      ),

      // ================= CUSTOM NAVBAR =================
      // Kita panggil widget yang sudah dipisah tadi di sini
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: 0,
        onTap: (index) {
          // Logika pindah halaman nanti di sini
          print("Menu $index diklik");
        },
      ),
    );
  }

  // Widget kecil untuk Item Toko
  Widget _buildStoreItem(
    BuildContext context,
    String name,
    String info,
    String rating,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/store.png",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  info,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 12, color: Colors.orange),
                    const SizedBox(width: 2),
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
    );
  }
}
