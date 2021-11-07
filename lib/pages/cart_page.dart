import 'package:fakestore_flutter/controllers/cart_page_controller.dart';
import 'package:fakestore_flutter/widgets/image_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_card_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartPageController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('FakeStore App'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: Obx(
          () => (controller.productList.isEmpty)
              ? const Center(
                  child: Text('Корзина пуста'),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                      itemCount: controller.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.productList[index];
                        return ListTile(
                          title: TextButton(
                            onPressed: () {
                              Get.to(() => ProductCardPage(id: item.id));
                            },
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 8,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          subtitle: Text(
                            item.price.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.removeProduct(item);
                            },
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red[300],
                              size: 30,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          leading: ImageProductWidget(
                            urlImage: item.image,
                          ),
                        );
                      }),
                ),
        ));
  }
}
