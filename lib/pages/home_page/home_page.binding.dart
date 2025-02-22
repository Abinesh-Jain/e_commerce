import 'package:get/get.dart';

import 'home_page.controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => HomePageController());
}
