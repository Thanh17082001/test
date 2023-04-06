import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductsServices {
  Future<List<Product>> fetchProducts() async {
    final List<Product> products = [];
    try {
      final url = Uri.parse("http://192.168.1.11:3001/api/contacts/");
      final response = await http.get(url);
      final result = json.decode(response.body);
      if (response.statusCode != 200) {
        return products;
      }
      result.forEach((product) {
        products.add(Product.fromJson(product));
      });
      return products;
    } catch (err) {
      print(err.toString());
      print("thienthanh dang cap");
      return products;
    }
  }
}
