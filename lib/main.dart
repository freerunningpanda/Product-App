import 'package:fakestore_flutter/controllers/download_controller.dart';
import 'package:fakestore_flutter/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/fakestore_api.dart';
import 'controllers/cart_page_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final fakeStoreProvider = FakeStoreProvider();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DownloadController(fakeStoreProvider));
    // Get.lazyPut(() => CartPageController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product page',
        home: MainPageFakeStoreApp(fakeStoreProvider: fakeStoreProvider));
  }
}
