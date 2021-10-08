import 'package:dio/dio.dart';
import 'package:fakestore_flutter/widgets/image_products_widget.dart';
import 'package:flutter/material.dart';

import '../product.dart';

class ProductCardPage extends StatefulWidget {
  final int productId;
  const ProductCardPage({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductCardPageState createState() => _ProductCardPageState();
}

class _ProductCardPageState extends State<ProductCardPage> {
  var dio = Dio();
  late final Product product;
  bool isLoad = false;

  @override
  void initState() {
    fetchProduct(widget.productId);
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
    return Scaffold(
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
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      product.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'price: ${product.price}',
                      style: const TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'category: ${product.category.trim()}',
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black87),
                    ),
                    Expanded(
                        child: ImageProductWidget(
                      urlImage: product.image,
                      width: 300,
                    )),
                    Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              product.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20.0),
                            ))),
                  ],
                )));
  }
}
