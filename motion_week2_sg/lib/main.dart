import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/cart.dart';
import 'package:motion_week2_sg/controller/navbar_controller.dart';
import 'package:motion_week2_sg/pages/detail_page/bindings/detail_product_binding.dart';
import 'package:motion_week2_sg/pages/detail_page/view/detail_page.dart';
import 'package:motion_week2_sg/pages/favorite_page/binding/favorite_binding.dart';
import 'package:motion_week2_sg/pages/favorite_page/view/favorite_page.dart';
import 'package:motion_week2_sg/pages/login_page/binding/login_binding.dart';
import 'package:motion_week2_sg/pages/login_page/login_page.dart';
import 'package:motion_week2_sg/pages/profile/binding/profile_binding.dart';
import 'package:motion_week2_sg/pages/profile/view/profile_page.dart';
import 'package:motion_week2_sg/pages/register_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:motion_week2_sg/pages/home_page/view/shop_page.dart';
import 'package:motion_week2_sg/pages/transaction.dart';
import 'package:motion_week2_sg/widgets/bottom_navigation_bar.dart';

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
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/', page: () => const MainPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            binding: LoginBinding()),
        GetPage(
            name: '/detail_product',
            page: () => DetailPage(),
            binding: DetailProductBinding()),
        GetPage(
          name: '/cart',
          page: () => cart(),
        ),
        GetPage(name: '/transaction', page: () => Transaction()),
        GetPage(
            name: '/favorite',
            page: () => const FavoritePage(),
            binding: FavoriteBinding()),
        GetPage(
            name: '/profile',
            page: () => const ProfilePage(),
            binding: ProfileBinding()),
      ],
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());

    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/shop':
              return GetPageRoute(page: () => const PageShop());
            case '/favorite':
              return GetPageRoute(page: () => const FavoritePage());
            case '/profile':
              return GetPageRoute(page: () => const ProfilePage());
            default:
              return GetPageRoute(page: () => const PageShop());
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(controller: controller),
    );
  }
}
