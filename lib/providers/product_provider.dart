import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/product.dart';
import '../utils/urls.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  final List<Product> _cart = [];

  List<Product> get products => _products;
  List<Product> get cart => _cart;

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.fakeStoreApi));
    if (response.statusCode == 200) {
      _products = (json.decode(response.body) as List)
          .map((data) => Product.fromJson(data))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void addToCart(Product product) {
    final existingIndex = _cart.indexWhere((item) => item.id == product.id);
    if (existingIndex != -1) {
      _cart[existingIndex] = _cart[existingIndex].copyWith(
        quantity: (_cart[existingIndex].quantity ?? 0) + 1,
      );
    } else {
      _cart.add(product.copyWith(quantity: 1));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    final existingIndex = _cart.indexWhere((item) => item.id == product.id);
    if (existingIndex != -1) {
      if ((_cart[existingIndex].quantity ?? 1) > 1) {
        _cart[existingIndex] = _cart[existingIndex].copyWith(
          quantity: (_cart[existingIndex].quantity ?? 1) - 1,
        );
      } else {
        _cart.removeAt(existingIndex);
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  double get total {
    return _cart.fold(
      0.0,
      (sum, item) => sum + (item.price ?? 0) * (item.quantity ?? 1),
    );
  }
}
