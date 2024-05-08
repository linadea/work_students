import 'package:get/get.dart';

import '../domain/usecases/auth_usecases.dart';

void setupDependencies() {
  Get.lazyPut<AuthUsecases>(() => AuthUsecasesImpl());
}
