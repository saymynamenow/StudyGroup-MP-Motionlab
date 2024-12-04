import 'package:flutter/material.dart';
import 'package:motion_week2_sg/pages/login_page.dart';
import 'package:motion_week2_sg/pages/register_page.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}

class Product {
  String productTitle;
  int price;
  String imageUrl;
  Color productColor;
  bool isFavorite;
  Product(
    this.productTitle,
    this.price,
    this.imageUrl,
    this.productColor,
    this.isFavorite,
  );
}

class PageShop extends StatelessWidget {
  const PageShop({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product("Mi Band 8 Pro", 54, "assets/images/product.png",
          const Color(0xfFf3f1ed), true),
      Product("Lycra Men's Shirt", 12, "assets/images/product2.png",
          const Color(0xfff5f9e0), false),
      Product("Siberia 800", 45, "assets/images/product3.png",
          const Color(0xFFf5f9e0), false),
      Product("Strawberry Frappuccino", 35, "assets/images/product4.png",
          const Color(0xfFfae4e6), false)
    ];
    List<String> category = ["Watch", "Shirt", "Shoes", "Pants"];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/hamburger.png",
                    width: 25,
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 50,
                    height: 50,
                  ),
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 35,
                  )
                ],
              ),
              const SizedBox(
                height: 67,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Our way of loving\nyou back",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            fillColor: const Color(0xFFF2F2F2),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                            prefixIcon: const Icon(Icons.search_outlined)),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 92,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF00623B),
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "All",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Raleway',
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  )
                                ],
                              );
                            }

                            return Row(
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF2F2F2),
                                      foregroundColor: const Color(0xFF4D4D4D),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      category[index - 1],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      const Text(
                        "Our Best Seller",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              padding: const EdgeInsets.only(
                                  bottom: kBottomNavigationBarHeight + 50),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              mainAxisSpacing: 115,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.9,
                              children: List.generate(
                                products.length,
                                (index) {
                                  final product = products[index];
                                  return Wrap(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(1),
                                        height: 251,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(9.72),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: product.productColor,
                                                borderRadius:
                                                    BorderRadius.circular(9.72),
                                              ),
                                              height: 187,
                                              child: Image.asset(
                                                product.imageUrl,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 9,
                                                  ),
                                                  Text(
                                                    product.productTitle,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\$${product.price}.00",
                                                        style: const TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFF00623B)),
                                                      ),
                                                      product.isFavorite
                                                          ? const Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                            )
                                                          : const Icon(
                                                              Icons
                                                                  .favorite_rounded,
                                                              color:
                                                                  Colors.grey,
                                                            )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 74,
        color: const Color(0xFF00623B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.wallet_outlined,
                size: 30,
                color: Color(0xFFB4DCCC),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline_rounded,
                size: 30,
                color: Color(0xFFB4DCCC),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 30,
                color: Color(0xFFB4DCCC),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: 33,
                    ),
                    Text(
                      "Product Details",
                      style: TextStyle(fontSize: 22),
                    ),
                    Icon(
                      Icons.favorite,
                      size: 33,
                      color: Colors.red,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/productsPage.png",
                          width: double.infinity,
                          height: 401,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Mi Band 8 Pro",
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "\$54.00",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF00623B),
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        const Text(
                          "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    print("Di Click");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF00623B),
                    ),
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "Add To Bag",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 39,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
