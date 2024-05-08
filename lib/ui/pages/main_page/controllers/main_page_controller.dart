import 'package:get/get.dart';

class MainPageController extends GetxController {
  var isStudent = false.obs;
  var isEmployer = false.obs;

  void setStudent(bool value) {
    isStudent.value = value;
    if (value) {
      isEmployer.value = !value;
    }
  }

  void setEmployer(bool value) {
    isEmployer.value = value;
    if (value) {
      isStudent.value = !value;
    }
  }
}
