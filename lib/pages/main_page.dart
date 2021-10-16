import 'package:fakestore_flutter/api/fakestore_api.dart';
import 'package:fakestore_flutter/controllers/download_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/image_products_widget.dart';
import 'product_card_page.dart';

class MainPageFakeStoreApp extends StatelessWidget {
<<<<<<< HEAD
  final FakeStoreProvider fakeStoreProvider, categoryProvider;
  const MainPageFakeStoreApp(
      {Key? key,
      required this.fakeStoreProvider,
      required this.categoryProvider})
      : super(key: key);
=======
  final FakeStoreProvider _fakeStoreProvider;
  const MainPageFakeStoreApp({Key? key, required FakeStoreProvider fakeStoreProvider})
      : _fakeStoreProvider = fakeStoreProvider, super(key: key);
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DownloadController>();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('FakeStore App'),
            centerTitle: true,
            backgroundColor: Colors.grey[900],
          ),
<<<<<<< HEAD
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.grey[900]),
                  child: const Text('Categories',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  title: const Text(
                    'Electronics',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    !controller.isLoad.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Get.to(() => MainPageFakeStoreApp(
                            categoryProvider: categoryProvider,
                            fakeStoreProvider: fakeStoreProvider));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Jewelery',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    'Men\'s clothing',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    'Women\'s clothing',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
=======
          drawer: Drawer(),
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
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
                                : Get.to(() => ProductCardPage(
<<<<<<< HEAD
                                    id: item.id,
                                    fakeStoreProvider: fakeStoreProvider))
=======
                                      id: item.id,
                                      fakeStoreProvider: _fakeStoreProvider,
                                    ))
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
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
