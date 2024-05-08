import 'package:get/get.dart';

import '../controllers/main_page_controller.dart';

class MainPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
  }
}
