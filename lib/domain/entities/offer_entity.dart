import 'package:freezed_annotation/freezed_annotation.dart';

import 'person_entity.dart';

part 'offer_entity.freezed.dart';

@freezed
class OfferEntity with _$OfferEntity {
  const factory OfferEntity({
    @Default('') String id,
    @Default('') String title,
    @Default(null) PersonEntity? customer,
    @Default('') String description,
    @Default('') String salary,
    @Default('') String employment,
  }) = _OfferEntity;
}
