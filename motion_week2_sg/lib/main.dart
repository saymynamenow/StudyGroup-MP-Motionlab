import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/cart.dart';
import 'package:motion_week2_sg/controller/cart_controller.dart';
import 'package:motion_week2_sg/pages/detail_page/bindings/detail_product_binding.dart';
import 'package:motion_week2_sg/pages/detail_page/controller/detail_page_controller.dart';
import 'package:motion_week2_sg/pages/detail_page/view/detail_page.dart';
import 'package:motion_week2_sg/pages/login_page.dart';
import 'package:motion_week2_sg/pages/register_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:motion_week2_sg/pages/home_page/view/shop_page.dart';
import 'package:motion_week2_sg/pages/transaction.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyWidget());
  FlutterNativeSplash.remove();
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const PageShop()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(
            name: '/detail_product',
            page: () => DetailPage(),
            binding: DetailProductBinding()),
        GetPage(
          name: '/cart',
          page: () => cart(),
        ),
        GetPage(name: '/transaction', page: () => Transaction()),
      ],
    );
  }
}

class MainApp extends GetView<DetailProductController> {
  final CartController cartController = Get.put(CartController());
  MainApp({super.key});

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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  // Navigator.pushNamed(context, '/cart');
                                  // cartController.addProduct(ProductElement(
                                  //     id: controller.detailProduct.value.id ??
                                  //         0));
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
