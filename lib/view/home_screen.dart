import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_basic/controller/cart_controller.dart';
import 'package:get_x_basic/controller/catalog_controller.dart';

class HomePage extends StatelessWidget {
  final CatalogController catalogController = Get.put(CatalogController());
  final CartController cartController = Get.put(CartController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => catalogController.isLoadingComplete == false
                    ? ListView.builder(
                        itemCount: catalogController.products.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.deepPurpleAccent,
                            margin: const EdgeInsets.all(12),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${catalogController.products[index].name}',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          Text(
                                              '${catalogController.products[index].desc}'),
                                        ],
                                      ),
                                      Text(
                                          '\$${catalogController.products[index].price}',
                                          style: TextStyle(fontSize: 24)),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      cartController.addToCart(
                                          catalogController.products[index]);
                                    },
                                    child: Text('Add to Cart'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            ),

            Obx(() => Text(
                'Total Amount \$ ${cartController.totalAmount.toString()}')),
            //  GetX<CartController>(
            //   builder: (controller) {
            //     return Text(controller.cartItems.length.toString());
            //   },
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Obx(() => Text(cartController.cartCount.toString()))),
    );
  }
}
