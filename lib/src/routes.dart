import 'package:get/get.dart';

import '../pages/home_page/home_page.binding.dart';
import '../pages/home_page/home_page.view.dart';
import '../pages/marketplace_detail_page/marketplace_detail_page.binding.dart';
import '../pages/marketplace_detail_page/marketplace_detail_page.view.dart';

class Routes {
  static const home = '/';
  static const request = '/request';

  static List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.request,
      page: () => MarketplaceDetailPageView(),
      binding: MarketplaceDetailPageBinding(),
    ),
  ];
  
}
