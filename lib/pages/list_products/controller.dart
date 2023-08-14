import 'package:get/get.dart';

import '../../models/product.dart';
import '../../repositories/products.dart';

class ListProductsController extends GetxController {
  RxBool isLoading = false.obs;
  List<Product> products = [];

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  Future<void> loadProducts() async {
    isLoading(true);
    products = await ProductsRepository.findMany();
    isLoading(false);
  }
}
