import 'package:get/get.dart';

class CartController extends GetxController {
  final quantity = 0.obs;
  final quantityCart2 = 0.obs;

  void quantityIncrement() => quantity.value++;
  void quantityDecrement() => quantity.value--;
  void quantityIncrement2() => quantityCart2.value++;
  void quantityDecrement2() => quantityCart2.value--;
}
