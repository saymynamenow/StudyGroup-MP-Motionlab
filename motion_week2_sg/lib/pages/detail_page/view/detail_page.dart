import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/models/product_model_api.dart';
import '../controller/detail_page_controller.dart';
import 'package:motion_week2_sg/controller/cart_controller.dart';

class DetailPage extends GetView<DetailProductController> {
  final CartController cartController = Get.put(CartController());
  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProductController>(
        init: DetailProductController(),
        builder: (_) {
          return Obx(
            () => MaterialApp(
              home: Scaffold(
                body: controller.isLoading.value
                    ? const Material(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.chevron_left,
                                      size: 33,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 70,
                                  ),
                                  const Text(
                                    "Product Details",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  // Icon(
                                  //   Icons.favorite,
                                  //   size: 33,
                                  //   color: product.isFavorite ? Colors.red : Colors.grey,
                                  // )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        controller.detailProduct.value
                                                .thumbnail ??
                                            "",
                                        width: double.infinity,
                                        height: 401,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller.detailProduct.value.title ??
                                            "",
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$${controller.detailProduct.value.price}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF00623B),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 19,
                                      ),
                                      Text(
                                        controller.detailProduct.value
                                                .description ??
                                            "",
                                        style: const TextStyle(fontSize: 18),
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
                                  Navigator.pushNamed(context, '/cart');
                                  cartController.addProduct(ProductElement(
                                    id: controller.detailProduct.value.id ?? 0,
                                    title:
                                        controller.detailProduct.value.title ??
                                            "",
                                    thumbnail: controller
                                            .detailProduct.value.thumbnail ??
                                        "",
                                    price:
                                        controller.detailProduct.value.price ??
                                            0,
                                  ));
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
            ),
          );
        });
  }
}
