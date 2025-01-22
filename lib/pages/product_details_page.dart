import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/utils/strings.dart';
import 'package:e_commerce/utils/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product?;
    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.productDetails),
        ),
        body: const Center(
          child: Text(Strings.noProduct),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? Strings.productDetails),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Hero(
            tag: product,
            child: CupertinoContextMenu(
              actions: [
                CupertinoContextMenuAction(
                  onPressed: () => Navigator.pop(context),
                  trailingIcon: CupertinoIcons.heart,
                  child: const Text(Strings.like),
                )
              ],
              child: Image.network(product.image ?? Urls.picsumPhotos),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            product.title ?? Strings.productName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${product.price}',
            style: const TextStyle(fontSize: 20, color: Colors.green),
          ),
          const SizedBox(height: 16),
          Text(product.description ?? Strings.noDescription),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              context.read<ProductProvider>().addToCart(product);
              Navigator.pushNamed(context, '/checkout');
            },
            label: const Text(Strings.addToCartAndBuy),
            icon: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
