import 'package:get/get.dart';

import '../../../../domain/entities/person_type_enum_entity.dart';
import '../../../controllers/global_person_controller.dart';

class MainPageController extends GetxController {
  var isStudent = false.obs;
  var isEmployer = false.obs;

  final personController = Get.find<GlobalPersonController>();

  void setStudent(bool value) {
    isStudent.value = value;
    if (value) {
      isEmployer.value = !value;
      personController.setPersonType(PersonTypeEnumEntity.student);
    }
  }

  void setEmployer(bool value) {
    isEmployer.value = value;
    if (value) {
      isStudent.value = !value;
      personController.setPersonType(PersonTypeEnumEntity.customer);
    }
  }
}
