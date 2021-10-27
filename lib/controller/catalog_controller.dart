import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:get_x_basic/model/catalog_model.dart';
import 'package:get_x_basic/utils/webservices.dart';
import 'package:http/http.dart' as http;

class CatalogController extends GetxController {
  var products = <Product>[].obs;
  var isLoadingComplete = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchProducts();
  }

  void fetchProducts() async {
    var response = await http.get(Uri.parse(Webservices.json_file_url));
    if (response.statusCode == 200) {
      isLoadingComplete.value = false;
      var jsonData = jsonDecode(response.body);
      var decodedData = jsonData['products'];
      products.value =
          List.from(decodedData).map((e) => Product.fromMap(e)).toList();
    } else {
      isLoadingComplete.value = true;
      print("Fetching error");
    }
  }
}
