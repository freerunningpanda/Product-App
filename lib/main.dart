import 'package:fakestore_flutter/controllers/download_controller.dart';
import 'package:fakestore_flutter/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/src/fakestore_api.dart';

void main(){
  runApp(MyApp(fakeStoreProvider: FakeStoreProvider(),));
}

class MyApp extends StatelessWidget {
  final FakeStoreProvider fakeStoreProvider;
  
  const MyApp({Key? key, required this.fakeStoreProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DownloadController(fakeStoreProvider));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product page',
        home: MainPageFakeStoreApp(fakeStoreProvider: fakeStoreProvider));
  }
}
