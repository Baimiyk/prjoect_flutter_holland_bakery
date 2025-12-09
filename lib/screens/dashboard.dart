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
                    children: [
                      const Text(
                        "Hi, Fufufafa!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
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
                    children: const [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Color(0xFFFF5621),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.notifications_outlined,
                        color: Color(0xFFFF5621),
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
                  ),
                  const SizedBox(width: 10),
                  Container(
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
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.verified_user_outlined,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Silver",
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey.shade300,
                    ), // Garis pemisah
                    Expanded(
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
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= BANNER =================
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/promo1.png"),
                    fit: BoxFit.cover, // biar gambar full & gak stretch
                  ),
                ),
                // Kalau mau tetep ada teks "POTONGAN ONGKIR" di atas gambar:
                child: Stack(
                  children: [
                    Positioned(
                      right: 20,
                      top: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "POTONGAN\nONGKIR",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 4,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                "Holland Bakery Banyumanik",
                "3.2 km | 12-25 mins",
                "4.8",
              ),
              const SizedBox(height: 15),
              _buildStoreItem(
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
  Widget _buildStoreItem(String name, String info, String rating) {
    return Row(
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
    );
  }
}
