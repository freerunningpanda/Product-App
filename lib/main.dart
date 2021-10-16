import 'package:fakestore_flutter/controllers/download_controller.dart';
import 'package:fakestore_flutter/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/fakestore_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final fakeStoreProvider = FakeStoreProvider();
  final categoryProvider = FakeStoreProvider();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DownloadController(fakeStoreProvider, categoryProvider));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product page',
        home: MainPageFakeStoreApp(
            fakeStoreProvider: fakeStoreProvider,
            categoryProvider: categoryProvider));
  }
}
