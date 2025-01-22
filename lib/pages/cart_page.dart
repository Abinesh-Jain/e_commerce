import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/utils/strings.dart';
import 'package:e_commerce/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../src/routes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<ProductProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.cart),
        actions: [
          if (cart.isNotEmpty)
            const Tooltip(
              message: Strings.dragToRemove,
              triggerMode: TooltipTriggerMode.tap,
              child: Icon(Icons.delete_sweep),
            ),
        ],
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
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        confirmDismiss: (direction) => showDialog(
                          context: context,
                          builder: (context) => AlertDialog.adaptive(
                            title: const Text(Strings.removeFromCart),
                            content: const Text(Strings.areYouSure),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text(Strings.cancel),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text(Strings.ok),
                              ),
                            ],
                          ),
                        ),
                        onDismissed: (direction) => context
                            .read<ProductProvider>()
                            .removeFromCart(cart[index]),
                        key: ValueKey(cart[index]),
                        child: ListTile(
                          leading: Image.network(
                              cart[index].image ?? Urls.picsumPhotos),
                          title: Text(cart[index].title ?? Strings.productName),
                          subtitle: Text('\$${cart[index].price}'),
                          trailing: CircleAvatar(
                              child: Text('x${cart[index].quantity ?? 1}')),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
                const Divider(),
                ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.checkout),
                  label: const Text(Strings.checkoutNow),
                ),
                const SizedBox(height: 16),
              ],
            ),
    );
  }
}
