import 'package:work_students/domain/entities/person_entity.dart';
import 'package:work_students/domain/repositories/person_repository.dart';

import '../../domain/entities/person_type_enum_entity.dart';

class MockPersonRepository implements PersonRepository {
  PersonEntity _getStudent() {
    return const PersonEntity.student(
      id: 's1',
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
      desiredSalary: '',
      education: '',
      employment: '',
      experience: '',
      imageUrl: '',
      offers: [],
    );
  }

  PersonEntity _getCustomer() {
    return const PersonEntity.customer(
        id: 'c1',
        firstName: '',
        lastName: '',
        email: '',
        phone: '',
        company: '',
        city: '',
        students: []);
  }

  @override
  Future<PersonEntity> getAllPersons(PersonTypeEnumEntity personType) async {
    if (personType == PersonTypeEnumEntity.student) {
      return _getStudent();
    } else {
      return _getCustomer();
    }
  }
}
