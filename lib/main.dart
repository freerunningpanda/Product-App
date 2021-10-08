import 'package:fakestore_flutter/controllers/download_controller.dart';
import 'package:fakestore_flutter/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DownloadController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product page',
        home: MainPageFakeStoreApp());
  }
}
