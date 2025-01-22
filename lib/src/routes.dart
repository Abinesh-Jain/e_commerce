import '../pages/cart_page.dart';
import '../pages/checkout_page.dart';
import '../pages/product_details_page.dart';
import '../pages/product_page.dart';

class Routes {
  static const String home = '/';
  static const String products = '/products';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String checkout = '/checkout';

  static final routes = {
    home: (context) => const ProductPage(),
    products: (context) => const ProductPage(),
    productDetails: (context) => const ProductDetailsPage(),
    cart: (context) => const CartPage(),
    checkout: (context) => const CheckoutPage(),
  };
}
