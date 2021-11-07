import 'package:fakestore_flutter/api/fakestore_api.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class ProductCardPageController extends GetxController {
  final FakeStoreApiProduct productProvider;
  late Product product;
  var isLoad = false.obs;

  ProductCardPageController({required this.productProvider});

  Future<void> fetchProduct(int id) async {
    isLoad.value = false;
    try {
      product = await productProvider.getProduct(id);
      isLoad.value = true;
    } on FakeStoreException catch (e) {
      Get.snackbar('Oo', e.toString());
    }
  }
}
