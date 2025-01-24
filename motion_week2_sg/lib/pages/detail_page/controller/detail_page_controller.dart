import 'package:get/get.dart';
import 'package:motion_week2_sg/models/product_model_api.dart';
import 'package:motion_week2_sg/services/product_services.dart';

class DetailProductController extends GetxController {
  var id = Get.arguments['id'];
  var detailProduct = ProductElement().obs;
  var isLoading = true.obs;
  @override
  onInit() {
    fetchDetailProduct();
    id = Get.arguments['id'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    id = Get.arguments['id'];
    fetchDetailProduct();
  }

  void fetchDetailProduct() async {
    print(id);
    detailProduct.value =
        await ProductService().getProductById(id: id) ?? ProductElement();
    isLoading.value = false;
  }
}
