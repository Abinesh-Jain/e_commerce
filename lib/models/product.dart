import 'package:e_commerce/models/rating.dart';

class Product {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final String? image;
  final Rating? rating;
  final int? quantity;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
    this.rating,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      quantity: json['quantity'],
    );
  }

  Product copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? image,
    Rating? rating,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      quantity: quantity ?? this.quantity,
    );
  }
}
