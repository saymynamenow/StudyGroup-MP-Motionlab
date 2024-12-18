import 'package:flutter/material.dart';
import 'package:motion_week2_sg/cart.dart';
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
        '/': (context) => const PageShop(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/product1': (context) => const MainApp(),
        '/cart': (context) => cart(),
        '/transaction': (context) => Transaction()
      },
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
                    const Icon(
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
                    Navigator.pushNamed(context, '/cart');
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
