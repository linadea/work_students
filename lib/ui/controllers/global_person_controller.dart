import 'package:get/get.dart';

import '../../domain/entities/person_entity.dart';
import '../../domain/entities/person_type_enum_entity.dart';

class GlobalPersonController extends GetxController {
  Rx<PersonEntity>? _person;
  Rx<PersonTypeEnumEntity>? _personType;

  PersonEntity? get person => _person?.value;
  PersonTypeEnumEntity? get personType => _personType?.value;

  void setPerson(PersonEntity person) {
    _person?.value = person;
  }

  void setPersonType(PersonTypeEnumEntity personType) {
    _personType?.value = personType;
  }
}
