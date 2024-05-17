import 'package:get/get.dart';
import 'package:work_students/domain/usecases/auth_usecases.dart';
import 'package:work_students/domain/usecases/person_usecases.dart';

import '../../../controllers/global_person_controller.dart';

class AuthPageController extends GetxController {
  final RxBool isLoading = false.obs;

  final RxString email = ''.obs;
  final RxString password = ''.obs;

  final _personController = Get.find<GlobalPersonController>();

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> signIn() async {
    AuthUsecases auth = Get.find<AuthUsecases>();
    PersonUsecases personUsecases = Get.find<PersonUsecases>();

    isLoading.value = true;

    try {
      await auth.signIn(email: email.value, password: password.value);
      if (_personController.person != null) {
        final person =
            await personUsecases.getAllPersons(_personController.personType!);
        _personController.setPerson(person);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    isLoading.value = false;
  }
}
