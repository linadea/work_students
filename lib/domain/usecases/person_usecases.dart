import 'package:get/get.dart';

import '../entities/person_entity.dart';
import '../entities/person_type_enum_entity.dart';
import '../repositories/person_repository.dart';

abstract class PersonUsecases {
  Future<PersonEntity> getAllPersons(PersonTypeEnumEntity personType);
}

class PersonUsecasesImpl implements PersonUsecases {
  final PersonRepository _personRepository = Get.find();

  @override
  Future<PersonEntity> getAllPersons(PersonTypeEnumEntity personType) =>
      _personRepository.getAllPersons(personType);
}
