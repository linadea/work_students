import 'package:work_students/domain/entities/person_type_enum_entity.dart';

import '../entities/person_entity.dart';

abstract class PersonRepository {
  Future<PersonEntity> getAllPersons(PersonTypeEnumEntity personType);
}
