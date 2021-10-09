import 'package:fakestore_flutter/controllers/download_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/image_products_widget.dart';
import 'product_card_page.dart';

class MainPageFakeStoreApp extends StatelessWidget {
  const MainPageFakeStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DownloadController>();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('FakeStore App'),
            centerTitle: true,
            backgroundColor: Colors.grey[900],
          ),
          body: !controller.isLoad.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: controller.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.productList[index];
                        return ListTile(
                          title: Text(
                            item.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            maxLines: 8,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            item.price.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.red[300],
                            size: 30,
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          onTap: () => {
                            !controller.isLoad.value
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Get.to(() => const ProductCardPage())
                          },
                          leading: ImageProductWidget(
                            urlImage: item.image,
                          ),
                        );
                      }),
                ),
        ));
  }
}
