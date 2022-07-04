import 'dart:io';

import 'package:http/http.dart' as http;
// import 'package:sports_shop_project/models/product.dart';

import '../models/models.dart';

class ProductsService {
  Future<List<Product>?> getAllProducts() async {
    var client = http.Client();
    var uri = Uri.parse('https://192.168.0.9:7070/api/Products');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    }
  }
}
