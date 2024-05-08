import 'package:get/get.dart';
import 'package:work_students/domain/usecases/auth_usecases.dart';

class AuthPageController extends GetxController {
  final RxBool isLoading = false.obs;

  final RxString email = ''.obs;
  final RxString password = ''.obs;

  void onEmailChanged(String value) {
    email.value = value;
  }

  void onPasswordChanged(String value) {
    password.value = value;
  }

  Future<void> signIn() async {
    AuthUsecases auth = Get.find<AuthUsecases>();
    isLoading.value = true;

    try {
      await auth.signIn(email: email.value, password: password.value);
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
