import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductsServices {
  Future<List<Product>> fetchProducts() async {
    final List<Product> products = [];
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/product'));
      final result = json.decode(response.body) as Map<String, dynamic>;
      result.forEach((key, product) {
        products.add(Product.fromJson(product));
      });

      if (response.statusCode != 200) {
        print("Error");
        return products;
      }
      return products;
    } catch (err) {
      print(err);
      return products;
    }
  }
}
