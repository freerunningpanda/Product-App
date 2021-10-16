import 'package:fakestore_flutter/api/fakestore_api.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class ProductCardPageController extends GetxController {
  final FakeStoreApiProduct productProvider;

  late final Product product;
  var isLoad = false.obs;
  final int id;

  ProductCardPageController({required this.id, required this.productProvider});

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  Future<void> fetchProduct() async {
    try {
      product = await productProvider.getProduct(id);
      isLoad.value = true;
    } on FakeStoreException catch (e) {
      Get.snackbar('Oo', e.toString());
    }
  }
}
