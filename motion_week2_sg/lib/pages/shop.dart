import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/Utils/dummy_data.dart';
import 'package:motion_week2_sg/controller/homepage_controller.dart';

class PageShop extends StatelessWidget {
  final HomepageController controller = Get.put(HomepageController());
  PageShop({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> category = DummyData.listDummyCatagory;

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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 35,
                    ),
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
                          itemCount: category.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(
                              () => Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            controller.selectedCategory.value ==
                                                    category[index]
                                                ? const Color(0xFF00623a)
                                                : Colors.white,
                                        foregroundColor: controller
                                                    .selectedCategory.value ==
                                                category[index]
                                            ? Colors
                                                .white // Teks warna saat dipilih
                                            : const Color(0xFF4D4D4D),
                                      ),
                                      onPressed: () {
                                        controller
                                            .selectCategory(category[index]);
                                      },
                                      child: Text(
                                        category[index],
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
                              ),
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
                      Obx(
                        () => Column(
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
                                  controller.products.length,
                                  (index) {
                                    final product = controller.products[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/detail_product',
                                          arguments: product.id,
                                        );
                                      },
                                      child: Wrap(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(1),
                                            height: 251,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(9.72),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
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
                                                        BorderRadius.circular(
                                                            9.72),
                                                  ),
                                                  height: 187,
                                                  child: Image.asset(
                                                    product.image,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 9,
                                                      ),
                                                      Text(
                                                        product.name,
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
                                                            "\$${product.price.toStringAsFixed(2)}",
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xFF00623B)),
                                                          ),
                                                          product.isFavorite
                                                              ? const Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                              : const Icon(
                                                                  Icons
                                                                      .favorite_rounded,
                                                                  color: Colors
                                                                      .grey,
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
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
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
