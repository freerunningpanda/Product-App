import 'package:fakestore_flutter/controllers/cart_page_controller.dart';
import 'package:fakestore_flutter/controllers/product_card_page_controller.dart';
import 'package:fakestore_flutter/widgets/image_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_page.dart';

class ProductCardPage extends StatelessWidget {
  final controller = Get.find<ProductCardPageController>();
  final int id;
  ProductCardPage({Key? key, required this.id}) : super(key: key) {
    controller.fetchProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartPageController>();

    return Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text('FakeStore App'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Get.to(() => const CartPage());
              },
              icon: const Icon(Icons.add_shopping_cart),
              tooltip: 'Cart',
            )
          ],
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
                    ElevatedButton(
                      child: const Text(
                        'Add to cart',
                      ),
                      onPressed: () {
                        cartController.addProduct(controller.product);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          primary: Colors.grey[900],
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )
                  ],
                ))));
  }
}
