import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
   Map<String, dynamic> toJson() {
    return {
      'title': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id:json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl']);
  }


  Product(
      {this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl}
  );

   

  Product copyWith(String? id, String? name, String? description, double? price,
      String? imageUrl) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}