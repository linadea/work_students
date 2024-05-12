import 'package:get/get.dart';

import '../data/repositories/person_repository.dart';
import '../domain/repositories/person_repository.dart';
import '../domain/usecases/auth_usecases.dart';

void setupDependencies() {
  Get.lazyPut<PersonRepository>(() => MockPersonRepository());
  Get.lazyPut<AuthUsecases>(() => AuthUsecasesImpl());
}
