import 'package:get/get.dart';

import '../controllers/offers_page_controller.dart';

class OffersPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffersPageController>(() => OffersPageController());
  }
}
