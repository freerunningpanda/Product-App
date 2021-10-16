import 'package:fakestore_flutter/api/fakestore_api.dart';
import 'package:fakestore_flutter/controllers/product_card_page_controller.dart';
import 'package:fakestore_flutter/widgets/image_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardPage extends StatelessWidget {
  final int id;
<<<<<<< HEAD
  final FakeStoreApiProduct fakeStoreProvider;
=======
  final FakeStoreProvider fakeStoreProvider;
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
  const ProductCardPage(
      {Key? key, required this.id, required this.fakeStoreProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() =>
        ProductCardPageController(id: id, productProvider: fakeStoreProvider));
    final controller = Get.find<ProductCardPageController>();
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
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      controller.product.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'price: ${controller.product.price}',
                      style: const TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'category: ${controller.product.category.trim()}',
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black87),
                    ),
                    Expanded(
                        child: ImageProductWidget(
                      urlImage: controller.product.image,
                      width: 300,
                    )),
                    Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              controller.product.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20.0),
                            ))),
                  ],
                ))));
  }
}
