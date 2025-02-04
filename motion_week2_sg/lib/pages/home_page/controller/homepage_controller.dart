import 'dart:convert';

import 'package:get/get.dart';
import 'package:motion_week2_sg/models/product_model_api.dart';
import 'package:motion_week2_sg/services/product_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageController extends GetxController {
  var isLoading = true.obs;
  var selectedCategory = 'All'.obs;
  var filteredproducts = Product().obs;
  var category = <String>[].obs;
  var product = Product().obs;
  var favorite_list = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategory();
    fetchProduct();
    loadFavorite();
  }

  Future<void> loadFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('favorite_product');
    List<String> favorite = prefs.getStringList("favorite_product") ?? [];
    favorite_list
        .assignAll(favorite.map((e) => jsonDecode(e) as Map<String, dynamic>));
  }

  Future<bool> isFavorite(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorite = prefs.getStringList("favorite_product") ?? [];
    return favorite.any((item) {
      final existingProduct = ProductElement.fromJson(jsonDecode(item));
      return existingProduct.id == productId;
    });
  }

  void selectCategory(String category) async {
    selectedCategory.value = category;
    if (category == 'All') {
      product.value = await ProductService().getProducts() ?? product();
    } else {
      final result =
          await ProductService().getProductByCategory(category: category);

      if (result != null) {
        product.value = result;
      } else {
        product.value = Product();
      }
    }
  }

  void fetchCategory() async {
    try {
      final result = await ProductService().fetchCategory();
      if (result != null) {
        category.value = ['All', ...result];
      } else {
        category.value = [];
      }
    } catch (e) {
      category.value = [];
      print('Error fetching categories: $e');
    }
  }

  void fetchProduct() async {
    product.value = await ProductService().getProducts() ?? product();
    isLoading.value = false;
  }

  Future<void> toggleFavorite(ProductElement product) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> favorite = prefs.getStringList("favorite_product") ?? [];

      bool isFavorited = favorite.any((item) {
        final existingProduct = ProductElement.fromJson(jsonDecode(item));
        return existingProduct.id == product.id;
      });

      if (isFavorited) {
        favorite.removeWhere((item) {
          final existingProduct = ProductElement.fromJson(jsonDecode(item));
          return existingProduct.id == product.id;
        });
      } else {
        favorite.add(jsonEncode(product.toJson()));
      }

      await prefs.setStringList("favorite_product", favorite);

      update();
    } catch (e) {
      print("Error toggling favorite: $e");
    }
  }
}
