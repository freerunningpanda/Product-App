import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../product.dart';

class DownloadController extends GetxController {
  final dio = Dio();
  var productList = <Product>[].obs;
  var isLoad = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetch20Products();
  }

  Future<void> fetch20Products() async {
    Future.delayed(const Duration(seconds: 3));
    var response = await dio.get('https://fakestoreapi.com/products');
    productList.value = (response.data as List<dynamic>)
        .map((e) => Product.fromJson(e))
        .toList();
    isLoad.value = true;
  }
}
