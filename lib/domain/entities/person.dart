import 'package:freezed_annotation/freezed_annotation.dart';

import 'offer.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  const factory Person.student({
    required String? id,
    required String? firstName,
    required String? lastName,
    String? phone,
    String? email,
    String? imageUrl,
    String? position,
    String? employment,
    String? experience,
    String? education,
    String? skills,
    String? desiredSalary,
    @Default([]) List<Offer> offers,
  }) = Student;

  const factory Person.customer({
    required String? id,
    required String? firstName,
    required String? lastName,
    String? phone,
    String? email,
    String? imageUrl,
    String? company,
    String? position,
    String? city,
    @Default([]) List<Person>? students,
  }) = Customer;
}
