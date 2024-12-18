import 'package:get/get.dart';
import 'package:motion_week2_sg/controller/cart_controller.dart';

class TransactionController extends GetxController {
  final total = 0.0.obs;
  final cartController = Get.put(CartController());
  bool hasProcessed = false;
  void processTransaction() {
    if (!hasProcessed) {
      int amountCart1 = cartController.quantity.value;
      int amountCart2 = cartController.quantityCart2.value;

      total.value = (amountCart1 * 54.0) + (amountCart2 * 12.0);
      hasProcessed = true;
    }
  }

  void resetTransaction() {
    total.value = 0;
    hasProcessed = false;
  }
}
