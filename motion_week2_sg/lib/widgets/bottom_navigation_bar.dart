import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/controller/navbar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavbarController controller;
  const CustomBottomNavigationBar({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomAppBar(
        height: 74,
        color: const Color(0xFF00623B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => Get.offNamed('/shop', id: 1),
              icon: Icon(
                Icons.home_rounded,
                size: 30,
                color: controller.currentIndex.value == 0
                    ? Colors.white
                    : const Color(0xFFB4DCCC),
              ),
            ),
            IconButton(
              onPressed: () => Get.offNamed('/favorite', id: 1),
              icon: Icon(
                Icons.favorite_outline_rounded,
                size: 30,
                color: controller.currentIndex.value == 1
                    ? Colors.white
                    : const Color(0xFFB4DCCC),
              ),
            ),
            IconButton(
              onPressed: () => Get.offNamed('/profile', id: 1),
              icon: Icon(
                Icons.person,
                size: 30,
                color: controller.currentIndex.value == 2
                    ? Colors.white
                    : const Color(0xFFB4DCCC),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
