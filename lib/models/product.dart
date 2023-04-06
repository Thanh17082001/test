import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String name;
  final String description;
  final int price;
  final String image;

  
   Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': image
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id:json['_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        image: json['image']);
  }


  Product(
      {this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image}
  );

   

  Product copyWith(String? id, String? name, String? description, int? price,
      String? image) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }
}
