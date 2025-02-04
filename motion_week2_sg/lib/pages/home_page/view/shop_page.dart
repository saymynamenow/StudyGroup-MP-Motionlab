import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/pages/home_page/controller/homepage_controller.dart';
import 'package:motion_week2_sg/shared/constanta.dart';

import '../../../widgets/bottom_navigation_bar.dart';
// import 'package:motion_week2_sg/models/product_models.dart';

class PageShop extends StatelessWidget {
  const PageShop({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
        init: HomepageController(),
        builder: (controller) {
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
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        primary: false,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: 0.60,
                                        ),
                                        itemCount: controller.product.value
                                                .products?.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          final data = controller
                                              .product.value.products?[index];

                                          return InkWell(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            onTap: () {
                                              Get.toNamed(
                                                "/detail_product",
                                                arguments: {"id": data.id},
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: const Color(0xFFFCFFFE),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    blurRadius: 5,
                                                    offset: const Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: Image.network(
                                                        data!.thumbnail!),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, top: 8),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          data.title ?? "",
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '\$${data.price}',
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  color: Color(
                                                                      0xFF00623B)),
                                                            ),
                                                            FutureBuilder(
                                                                future: controller
                                                                    .isFavorite(
                                                                        data
                                                                            .id!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  if (snapshot
                                                                          .connectionState ==
                                                                      ConnectionState
                                                                          .waiting) {
                                                                    return const CircularProgressIndicator();
                                                                  } else {
                                                                    bool
                                                                        isFavorite =
                                                                        snapshot.data ??
                                                                            false;
                                                                    return IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        controller
                                                                            .toggleFavorite(data);
                                                                      },
                                                                      icon:
                                                                          Icon(
                                                                        isFavorite
                                                                            ? Icons.favorite
                                                                            : Icons.favorite_border,
                                                                        color: isFavorite
                                                                            ? Colors.red
                                                                            : Colors.grey,
                                                                      ),
                                                                    );
                                                                  }
                                                                })
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}
