import 'package:fakestore_flutter/controllers/download_controller.dart';
import 'package:fakestore_flutter/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/fakestore_api.dart';
import 'controllers/cart_page_controller.dart';
import 'controllers/product_card_page_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final fakeStoreProvider = FakeStoreProvider();
  MyApp({Key? key}) : super(key: key) {
    Get.lazyPut(() => DownloadController(fakeStoreProvider));
    Get.put(CartPageController());
    Get.lazyPut(
        () => ProductCardPageController(productProvider: fakeStoreProvider),
        fenix: true);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product page',
        home: MainPageFakeStoreApp(fakeStoreProvider: fakeStoreProvider));
  }
}
