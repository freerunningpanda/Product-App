import 'package:fakestore_flutter/api/fakestore_api.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class DownloadController extends GetxController {
  final FakeStoreApiProducts productsProvider;
  final FakeStoreApiCategory categoryProvider;
  var productList = <Product>[].obs;
  var isLoad = false.obs;

  DownloadController(this.productsProvider, this.categoryProvider);
  @override
  void onInit() {
    super.onInit();
    fetch20Products();
  }

  Future<void> fetch20Products() async {
    try {
      productList.value = await productsProvider.getProducts();
      isLoad.value = true;
    } on FakeStoreException catch (e) {
      Get.snackbar('Oo', e.toString());
    }
  }

  Future<void> changeCategory(String category) async {
    isLoad.value = false;
    try {
      productList.value = await categoryProvider.getCategory(category);
      isLoad.value = true;
    } on FakeStoreException catch (e) {
      Get.snackbar('Oo', e.toString());
    }
  }

  Future<void> chengeCategory(String category) async{
    
  } 
}
