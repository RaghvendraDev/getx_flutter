import 'package:get/state_manager.dart';
import 'package:get_x_basic/model/catalog_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  var totalAmount = 0.obs;
  int get cartCount => cartItems.length;
  // double get totalAmount => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);

    totalAmount = totalAmount + product.price.toInt();
    // cartCount++;
  }
}
