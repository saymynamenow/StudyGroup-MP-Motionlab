import 'package:flutter/material.dart';
import 'package:motion_week2_sg/Utils/dummy_data.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/cart.dart';
import 'package:motion_week2_sg/controller/cart_controller.dart';
import 'package:motion_week2_sg/models/product_models.dart';
import 'package:motion_week2_sg/pages/login_page.dart';
import 'package:motion_week2_sg/pages/register_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:motion_week2_sg/pages/shop.dart';
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
    return MaterialApp(
      initialRoute: '/cart',
      routes: {
        '/': (context) => PageShop(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/detail_product': (context) => MainApp(),
        '/cart': (context) => cart(),
        '/transaction': (context) => Transaction()
      },
    );
  }
}

class MainApp extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    final ProductModel product =
        DummyData.DummyProduct.firstWhere((product) => product.id == id);
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Icon(
                      Icons.favorite,
                      size: 33,
                      color: product.isFavorite ? Colors.red : Colors.grey,
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
                          product.image,
                          width: double.infinity,
                          height: 401,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          product.name,
                          style: const TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF00623B),
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Text(
                          product.description,
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
                    cartController.addProduct(ProductModel(
                        id: product.id,
                        image: product.image,
                        name: product.name,
                        price: product.price,
                        description: product.description,
                        type: product.type,
                        isFavorite: product.isFavorite,
                        productColor: product.productColor));
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
