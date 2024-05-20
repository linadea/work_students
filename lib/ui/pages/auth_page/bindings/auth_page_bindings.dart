import 'package:get/get.dart';

import '../../../../core/dependencies.dart';
import '../controllers/auth_page_controller.dart';

class AuthPageBindings extends Bindings {
  @override
  void dependencies() {
    setupDependencies();
    Get.lazyPut<AuthPageController>(() => AuthPageController());
  }
}
