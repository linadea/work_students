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
        desiredSalary: '300-500\$/місяць',
        education: 'ПЗВО “ІТ СТЕП Університет”',
        employment: 'Повна зайнятість',
        experience: 'Немає',
        imageUrl: 'assets/png/adelina.png',
        position: 'UI/UX дизайнер',
        skills: 'Figma, Adobe Photoshop, Adobe Illustrator, Adobe XD',
        description:
            'Ключові навички:\n• Figma\n• Adobe Photoshop\n• Adobe Illustrator\n\nОсвіта:\n• Вища, ПЗВО “ІТ СТЕП Університет”\n\nДосвід роботи:\n• Немає\n\nТип зайнятості\n• Повна зайнятість, віддалена');
  }

  PersonEntity _getCustomer() {
    return const PersonEntity.customer(
      id: 'c1',
      firstName: 'Марк',
      lastName: 'Бережанський',
      phone: '+380 50 345 67 89',
      email: 'markberezh@gmail.com',
      imageUrl: 'assets/png/mark.png',
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
            imageUrl,
            position,
            phone,
            email,
            employment,
            experience,
            education,
            skills,
            desiredSalary,
            offers,
            description,
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
                    40,
                    (index) => OfferEntity(
                          id: 'o$index',
                          title: 'Junior UI/UX Designer',
                          description:
                              'Ключові завдання:\n• Розробка дизайну нових розділів/сторінок на вебсайтах та додатках\n• Підготовка макетів для розробників, оновлення та розширення UI Kit\n• Дослідження дизайнерських рішень, збір та аналіз референсів\n\nДосвід та навички:\n• Досвід створення дизайну сайтів від 1 року\n• Високий рівень володіння Figma, Adobe Photoshop',
                          salary: '500\$/місяць',
                          employment: 'Повна зайнятість',
                          customer: _getCustomer(),
                        )),
                description: description,
              ),
          orElse: () => throw ArgumentError('Invalid entity'));
    } else {
      return _getCustomer().maybeWhen(
          customer: (
            id,
            firstName,
            lastName,
            imageUrl,
            position,
            phone,
            email,
            company,
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
                  40,
                  (index) => _getStudent().copyWith(id: 's${index + 1}'),
                ),
              ),
          orElse: () => throw ArgumentError('Invalid entity'));
    }
  }
}
