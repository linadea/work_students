import 'package:get/get.dart';

import '../controllers/start_page_controller.dart';

class StartPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartPageController>(() => StartPageController());
  }
}
