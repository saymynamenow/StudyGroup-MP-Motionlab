import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/pages/detail_page/view/detail_page.dart';
import 'package:motion_week2_sg/pages/home_page/controller/homepage_controller.dart';
// import 'package:motion_week2_sg/models/product_models.dart';

class PageShop extends GetView<HomepageController> {
  const PageShop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
        init: HomepageController(),
        builder: (_) {
          return Obx(
            () => controller.isLoading.value
                ? const Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Scaffold(
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
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          fillColor: const Color(0xFFF2F2F2),
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: 'Search',
                                          hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                          prefixIcon: const Icon(
                                              Icons.search_outlined)),
                                    ),
                                    const SizedBox(
                                      height: 33,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.category.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Obx(
                                            () => Row(
                                              children: [
                                                SizedBox(
                                                  width: 120,
                                                  height: 40,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: controller
                                                                  .selectedCategory
                                                                  .value ==
                                                              controller
                                                                      .category[
                                                                  index]
                                                          ? const Color(
                                                              0xFF00623a)
                                                          : Colors.white,
                                                      foregroundColor: controller
                                                                  .selectedCategory
                                                                  .value ==
                                                              controller
                                                                      .category[
                                                                  index]
                                                          ? Colors
                                                              .white // Teks warna saat dipilih
                                                          : const Color(
                                                              0xFF4D4D4D),
                                                    ),
                                                    onPressed: () {
                                                      controller.selectCategory(
                                                          controller
                                                              .category[index]);
                                                    },
                                                    child: Text(
                                                      controller
                                                          .category[index],
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: 'Raleway',
                                                          fontWeight:
                                                              FontWeight.w300),
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
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GridView.count(
                                            padding: const EdgeInsets.only(
                                                bottom:
                                                    kBottomNavigationBarHeight +
                                                        50),
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 115,
                                            crossAxisSpacing: 15,
                                            childAspectRatio: 0.9,
                                            children: List.generate(
                                              controller.product.value.products
                                                      ?.length ??
                                                  0,
                                              (index) {
                                                final product = controller
                                                    .product
                                                    .value
                                                    .products?[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        '/detail_product',
                                                        arguments: {
                                                          'id': product!.id
                                                        });
                                                  },
                                                  child: Wrap(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .all(1),
                                                        height: 270,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      9.72),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.5),
                                                              spreadRadius: 2,
                                                              blurRadius: 7,
                                                            )
                                                          ],
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9.72),
                                                              ),
                                                              height: 187,
                                                              child:
                                                                  Image.network(
                                                                product?.thumbnail ??
                                                                    "",
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 9,
                                                                  ),
                                                                  Text(
                                                                    product?.title ??
                                                                        "",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
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
                                                                        "\$${product?.price ?? 0}",
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Color(0xFF00623B)),
                                                                      ),
                                                                      // product.isFavorite
                                                                      //     ? const Icon(
                                                                      //         Icons
                                                                      //             .favorite,
                                                                      //         color: Colors
                                                                      //             .red,
                                                                      //       )
                                                                      //     : const Icon(
                                                                      //         Icons
                                                                      //             .favorite_rounded,
                                                                      //         color: Colors
                                                                      //             .grey,
                                                                      //       )
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
                  ),
          );
        });
  }
}
