import 'package:fakestore_flutter/models/product.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  var productList = <Product>[].obs;

  CartPageController();

  void addProduct(Product product) {
    productList.add(product);
  }

  void removeProduct(Product product) {
    productList.remove(product);
  }

  double getSum() {
    var price = 0.0;
    for (var item in productList.value) {
      price += item.price;
    }
    return price;
  }
}
