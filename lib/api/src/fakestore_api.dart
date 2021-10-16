import 'package:dio/dio.dart';
import 'package:fakestore_flutter/models/product.dart';

import 'fake_store_api_exception.dart';

abstract class FakeStoreApiProduct {
  Future<Product> getProduct(int id);
}

abstract class FakeStoreApiProducts {
  Future<List<Product>> getProducts();
}

<<<<<<< HEAD
abstract class FakeStoreApiCategory {
  Future<List<Product>> getCategory(String id);
}

class FakeStoreProvider
    implements FakeStoreApiProduct, FakeStoreApiProducts, FakeStoreApiCategory {
=======

class FakeStoreProvider implements FakeStoreApiProduct, FakeStoreApiProducts {
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
  final dio = Dio();

  @override
  Future<Product> getProduct(int id) async {
    Future.delayed(const Duration(seconds: 6));
    try {
      await Future.delayed(const Duration(seconds: 3));
      var response = await dio.get('https://fakestoreapi.com/products/$id');
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      throw FakeStoreException('No 200 statusCode (${response.statusCode})');
    } on DioError catch (e) {
      throw FakeStoreException(e.message);
    }
  }

  @override
  Future<List<Product>> getProducts() async {
<<<<<<< HEAD
    try {
      Future.delayed(const Duration(seconds: 6));
=======
    Future.delayed(const Duration(seconds: 6));
    try {
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
      var response = await dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList();
      }
      throw FakeStoreException('No 200 statusCode (${response.statusCode})');
    } on DioError catch (e) {
      throw FakeStoreException(e.message);
    }
  }
<<<<<<< HEAD

  @override
  Future<List<Product>> getCategory(String category) async {
    try {
      Future.delayed(const Duration(seconds: 6));
      var response =
          await dio.get('https://fakestoreapi.com/products/category/$category');
      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList();
      }
      throw FakeStoreException('No 200 statusCode (${response.statusCode})');
    } on DioError catch (e) {
      throw FakeStoreException(e.message);
    }
  }
=======
>>>>>>> 6aaf49d50bc13fd275113aa5c012555584c58f6b
}
