import 'package:get/get.dart';
import 'package:motion_week2_sg/models/product_model_api.dart';
import 'package:motion_week2_sg/services/product_services.dart';

class HomepageController extends GetxController {
  var isLoading = true.obs;
  var selectedCategory = 'All'.obs;
  var filteredproducts = Product().obs;
  var category = <String>[].obs;
  var product = Product().obs;
  @override
  void onInit() {
    super.onInit();
    fetchCategory();
    fetchProduct();
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
}
