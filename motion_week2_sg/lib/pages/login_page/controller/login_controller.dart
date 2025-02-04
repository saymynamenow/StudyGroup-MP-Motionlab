import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_week2_sg/models/user_model.dart';
import 'package:motion_week2_sg/services/product_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  var isLoading = false.obs;
  @override
  void onClose() {
    username.dispose();
    password.dispose();
    super.onClose();
  }

  Future<bool> checkedLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('Is_Logged_In') ?? false;
  }

  Future<void> login() async {
    isLoading.value = true;
    update();
    try {
      final UserModel response = await ProductService().userLogin(
          username: username.text.trim(), password: password.text.trim());
      Get.offNamed('/');
      Get.snackbar('Login Successfull', 'Welcome, ${response.firstName}');
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("Is_Logged_In", true);
      await prefs.setString('username', response.username);
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
