import 'package:get/get.dart';
import 'package:motion_week2_sg/models/product_models.dart';
import 'package:motion_week2_sg/Utils/dummy_data.dart';

class HomepageController extends GetxController {
  var selectedCategory = 'All'.obs;
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    products.value = DummyData.DummyProduct;
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    if (category == 'All') {
      products.value = DummyData.DummyProduct;
    } else {
      products.value =
          DummyData.DummyProduct.where((product) => product.type == category)
              .toList();
    }
  }
}
