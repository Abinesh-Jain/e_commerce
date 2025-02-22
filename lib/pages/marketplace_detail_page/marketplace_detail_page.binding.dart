import 'package:get/get.dart';

import 'marketplace_detail_page.controller.dart';

class MarketplaceDetailPageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => MarketplaceDetailPageController());
}
