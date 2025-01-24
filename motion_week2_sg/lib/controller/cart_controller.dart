import 'package:get/get.dart';
import 'package:motion_week2_sg/models/product_model_api.dart';
import 'package:motion_week2_sg/pages/detail_page/controller/detail_page_controller.dart';

class CartController extends GetxController {
  RxList<ProductElement> cartProducts = <ProductElement>[].obs;
  var quantities = <int>[].obs;

  void addProduct(ProductElement product) {
    int index = cartProducts.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      quantities[index]++;
    } else {
      cartProducts.add(product);
      quantities.add(1);
    }
    Get.delete<DetailProductController>();
  }

  void quantityIncrement(int index) {
    quantities[index]++;
  }

  void quanitityDecrement(int index) {
    if (quantities[index] > 1) {
      quantities[index]--;
    } else {
      cartProducts.removeAt(index);
      quantities.remove(index);
    }
  }

  void resetProduct() {
    cartProducts.clear();
    quantities.clear();
  }

  double get totalPrice => cartProducts.asMap().entries.fold(
        0,
        (sum, entry) =>
            sum + ((entry.value.price ?? 0) * quantities[entry.key]),
      );
}
