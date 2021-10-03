import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:fakestore_flutter/product.dart';
import 'package:flutter/material.dart';

import 'package:fakestore_flutter/widgets/image_products_widget.dart';

void main() => runApp(const ProductFakeStoreApp());

class ProductFakeStoreApp extends StatefulWidget {
  const ProductFakeStoreApp({Key? key}) : super(key: key);

  @override
  State<ProductFakeStoreApp> createState() => _ProductFakeStoreAppState();
}

class _ProductFakeStoreAppState extends State<ProductFakeStoreApp> {
  final dio = Dio();
  // late final Product product;
  var productList = <Product>[];
  bool isLoad = false;

  @override
  void initState() {
    fetch20Products();
    super.initState();
  }

  // Future<void> fetchProduct([int id = 3]) async {
  //   // https://fakestoreapi.com/products
  //   var response = await dio.get('https://fakestoreapi.com/products/$id');
  //   setState(() {
  //     product = Product.fromJson(response.data);
  //     isLoad = true;
  //   });
  // }

  Future<void> fetch20Products() async {
    var response = await dio.get('https://fakestoreapi.com/products');
    setState(() {
      productList = (response.data as List<dynamic>)
          .map((e) => Product.fromJson(e))
          .toList();
      isLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product page',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FakeStore App'),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: !isLoad
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = productList[index];
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
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ImageProductWidget();
                        })),
                        leading: ImageProduts20Widget(
                          urlImage: item.image,
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}

class ImageProductWidget extends StatefulWidget {
  const ImageProductWidget({Key? key}) : super(key: key);

  @override
  _ImageProductWidgetState createState() => _ImageProductWidgetState();
}

class _ImageProductWidgetState extends State<ImageProductWidget> {
  var dio = Dio();
  late final Product product;
  bool isLoad = false;
  // _ImageProductWidgetState(this.product);

  @override
  void initState() {
    fetchProduct();
    super.initState();
  }

  Future<void> fetchProduct([int id = 3]) async {
    var response = await dio.get('https://fakestoreapi.com/products/$id');
    setState(() {
      product = Product.fromJson(response.data);
      isLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'price: ${product.price}',
          style: const TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'category: ${product.category.trim()}',
          style: const TextStyle(fontSize: 20.0, color: Colors.black87),
        ),
        Expanded(
            child: CachedNetworkImage(
          imageUrl: product.image,
          placeholder: (context, url) => Image.asset('assets/no_image.jpg'),
        )),
        Text(
          product.description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
