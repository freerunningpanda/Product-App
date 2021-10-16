import 'package:fakestore_flutter/api/fakestore_api.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class ProductCardPageController extends GetxController {
  final FakeStoreApiProduct productProvider;
<<<<<<< HEAD

=======
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
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
<<<<<<< HEAD
    } on FakeStoreException catch (e) {
=======
    } on FakeStoreException catch(e) {
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
      Get.snackbar('Oo', e.toString());
    }
  }
}
