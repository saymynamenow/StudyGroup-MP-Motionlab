import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  var filteredProduct = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    loadFavorite();
    super.onInit();
  }

  Future<void> loadFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorite = prefs.getStringList("favorite_product") ?? [];
    filteredProduct.value =
        favorite.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    update();
  }
}
