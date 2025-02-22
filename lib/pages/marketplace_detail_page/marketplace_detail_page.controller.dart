import 'package:get/get.dart';

import 'marketplace_detail_page.variables.dart';

class MarketplaceDetailPageController extends GetxController
    with MarketplaceDetailPageVariables {
  @override
  void onInit() {
    super.onInit();
    request = Get.arguments;
  }

  void share() {
    Get.snackbar('Share', 'Shared successfully !');
  }

  void delete() {
    Get.snackbar('Delete', 'Deleted successfully !');
  }

  void edit() {
    Get.snackbar('Edit', 'Editing enabled !');
  }

  void close() {
    Get.back();
  }

  void onShareViaWhatsapp() {
    Get.snackbar('Share via Whatsapp', 'Shared successfully !');
  }

  void onShareOnLinkedin() {
    Get.snackbar('Share on Linkedin', 'Shared successfully !');
  }
}
