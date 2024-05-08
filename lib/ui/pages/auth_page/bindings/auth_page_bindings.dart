import 'package:get/get.dart';

import '../controllers/auth_page_controller.dart';

class AuthPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthPageController>(() => AuthPageController());
  }
}
