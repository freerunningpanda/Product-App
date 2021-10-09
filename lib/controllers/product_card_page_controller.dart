import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../product.dart';

class ProductCardPageController extends GetxController {
  // final int productId;
  // ProductCardPageController({required this.productId});
  var dio = Dio();
  late final Product product;
  var isLoad = false.obs;

  @override
  void onInit() {
    // fetchProduct(productId);
    fetchProduct();
    super.onInit();
  }

  Future<void> fetchProduct([int id = 1]) async {
    await Future.delayed(const Duration(seconds: 3));
    var response = await dio.get('https://fakestoreapi.com/products/$id');
    product = Product.fromJson(response.data);
    isLoad.value = true;
  }
}
