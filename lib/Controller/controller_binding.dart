import 'package:bookstore/Controller/product_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
        () => ProductController());
  }
}