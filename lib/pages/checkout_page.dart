import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<ProductProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.checkout),
      ),
      body: cart.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 100,
                  ),
                  Text(Strings.emptyCart),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(cart[index].title ?? Strings.productName),
                      subtitle: Text(
                          '\$${cart[index].price} x ${cart[index].quantity}'),
                      trailing: Text(
                          '\$${(cart[index].price ?? 0) * (cart[index].quantity ?? 1)}'),
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text(Strings.total),
                  trailing: Text(
                    '\$${context.watch<ProductProvider>().total}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductProvider>().clearCart();
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        title: const Text(Strings.checkoutSuccess),
                        content: const Text(Strings.checkoutSuccessMessage),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(Strings.ok),
                          ),
                        ],
                      ),
                    ).then((value) => context.mounted
                        ? Navigator.popUntil(context, (route) => route.isFirst)
                        : null);
                  },
                  child: const Text(Strings.checkout),
                ),
                const SizedBox(height: 16),
              ],
            ),
    );
  }
}
