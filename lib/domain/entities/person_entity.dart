import 'package:freezed_annotation/freezed_annotation.dart';

import 'offer_entity.dart';

part 'person_entity.freezed.dart';

@freezed
class PersonEntity with _$PersonEntity {
  const factory PersonEntity.student({
    required String? id,
    required String? firstName,
    required String? lastName,
    required String? imageUrl,
    required String? position,
    String? phone,
    String? email,
    String? employment,
    String? experience,
    String? education,
    String? skills,
    String? desiredSalary,
    List<OfferEntity>? offers,
  }) = Student;

  const factory PersonEntity.customer({
    required String? id,
    required String? firstName,
    required String? lastName,
    required String? imageUrl,
    required String? position,
    String? phone,
    String? email,
    String? company,
    String? city,
    List<PersonEntity>? students,
  }) = Customer;

  const factory PersonEntity.empty({
    @Default('0') String? id,
    @Default('') String? firstName,
    @Default('') String? lastName,
    @Default('') String? imageUrl,
    @Default('') String? position,
  }) = Empty;
}
