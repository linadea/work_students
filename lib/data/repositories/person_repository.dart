import '../../domain/entities/offer_entity.dart';
import '../../domain/entities/person_entity.dart';
import '../../domain/entities/person_type_enum_entity.dart';
import '../../domain/repositories/person_repository.dart';

class MockPersonRepository implements PersonRepository {
  PersonEntity _getStudent() {
    return const PersonEntity.student(
      id: 's1',
      firstName: 'Аделіна',
      lastName: 'Марцінковська',
      email: 'amartsinkovska@gmail.com',
      phone: '+380 96 587 67 61',
      desiredSalary: '300-500\$',
      education: 'ПЗВО “ІТ СТЕП Університет”',
      employment: 'Повна зайнятість, віддалена',
      experience: 'Немає',
      imageUrl: 'adelina.png',
    );
  }

  PersonEntity _getCustomer() {
    return const PersonEntity.customer(
      id: 'c1',
      firstName: 'Марк',
      lastName: 'Бережанський',
      phone: '+380 50 345 67 89',
      email: 'markberezh@gmail.com',
      imageUrl: 'mark.png',
      company: 'N-iX',
      position: 'HR менеджер',
      city: 'Львів',
    );
  }

  @override
  Future<PersonEntity> getAllPersons(PersonTypeEnumEntity personType) async {
    if (personType == PersonTypeEnumEntity.student) {
      return _getStudent().maybeWhen(
          student: (
            id,
            firstName,
            lastName,
            phone,
            email,
            imageUrl,
            position,
            employment,
            experience,
            education,
            skills,
            desiredSalary,
            _,
          ) =>
              PersonEntity.student(
                id: id,
                firstName: firstName,
                lastName: lastName,
                phone: phone,
                email: email,
                imageUrl: imageUrl,
                position: position,
                employment: employment,
                experience: experience,
                education: education,
                skills: skills,
                desiredSalary: desiredSalary,
                offers: List.generate(
                    4,
                    (index) => OfferEntity(
                          id: 'o$index',
                          title: 'Junior UI/UX Designer',
                          description:
                              'Ключові завдання:\nРозробка дизайну нових розділів/сторінок на вебсайтах та додатках\nПідготовка макетів для розробників, оновлення та розширення UI Kit\nДослідження дизайнерських рішень, збір та аналіз референсів\n\nДосвід та навички:\nДосвід створення дизайну сайтів від 1 року\nВисокий рівень володіння Figma, Adobe Photoshop',
                          salary: '500\$/місяць',
                          employment: 'Повна зайнятість',
                          customer: _getCustomer(),
                        )),
              ),
          orElse: () => throw ArgumentError('Invalid entity'));
    } else {
      return _getCustomer().maybeWhen(
          customer: (
            id,
            firstName,
            lastName,
            phone,
            email,
            imageUrl,
            company,
            position,
            city,
            _,
          ) =>
              PersonEntity.customer(
                id: id,
                firstName: firstName,
                lastName: lastName,
                phone: phone,
                email: email,
                imageUrl: imageUrl,
                company: company,
                position: position,
                city: city,
                students: List.generate(
                  4,
                  (index) => _getStudent().copyWith(id: 's${index + 1}'),
                ),
              ),
          orElse: () => throw ArgumentError('Invalid entity'));
    }
  }
}
