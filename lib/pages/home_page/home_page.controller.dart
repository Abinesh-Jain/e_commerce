import 'package:get/get.dart';

import 'home_page.variables.dart';

class HomePageController extends GetxController with HomePageVariables {
  void onMenuTapped(int index) => page.value = index;

  void onTabTapped(int index) {
    tab.value = index;
    refresh();
  }

  void postRequest() {
    Get.snackbar('Post Request', 'Posted successfully !');
  }
}
