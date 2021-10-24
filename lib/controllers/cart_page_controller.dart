import 'package:fakestore_flutter/controllers/product_card_page_controller.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  final ProductCardPageController cartProvider;
  // var productList = <Product>[].obs;
  var productList = [].obs;

  CartPageController(this.cartProvider);

  void getProduct() {
    productList.add(cartProvider.product);
  }

  void removeProduct() {
    productList.remove(cartProvider.product);
  }

  void getSum() {
    for (var i = 0; i < cartProvider.product.price; i++) {}
  }
}
