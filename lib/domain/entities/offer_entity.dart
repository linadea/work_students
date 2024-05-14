import 'package:freezed_annotation/freezed_annotation.dart';

import 'person_entity.dart';

part 'offer_entity.freezed.dart';

@freezed
class OfferEntity with _$OfferEntity {
  const factory OfferEntity({
    required String id,
    required String title,
    required PersonEntity customer,
    required String description,
    required String salary,
    required String employment,
  }) = _OfferEntity;
}
