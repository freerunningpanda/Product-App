import 'package:dio/dio.dart';
import 'package:fakestore_flutter/models/product.dart';

import 'fake_store_api_exception.dart';

abstract class FakeStoreApiProduct {
  Future<Product> getProduct(int id);
}

abstract class FakeStoreApiProducts {
  Future<List<Product>> getProducts();
  Future<List<Product>> getCategory(String category);
}

class FakeStoreProvider implements FakeStoreApiProduct, FakeStoreApiProducts {
  final dio = Dio();

  @override
  Future<Product> getProduct(int id) async {
    try {
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
    try {
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

  @override
  Future<List<Product>> getCategory(String category) async {
    try {
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
}
