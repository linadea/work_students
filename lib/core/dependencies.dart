import 'package:get/get.dart';
import 'package:work_students/domain/usecases/person_usecases.dart';

import '../data/repositories/person_repository.dart';
import '../domain/repositories/person_repository.dart';
import '../domain/usecases/auth_usecases.dart';

void setupDependencies() {
  Get.lazyPut<PersonRepository>(() => MockPersonRepository());
  Get.lazyPut<PersonUsecases>(() => PersonUsecasesImpl());
  Get.lazyPut<AuthUsecases>(() => AuthUsecasesImpl());
}
