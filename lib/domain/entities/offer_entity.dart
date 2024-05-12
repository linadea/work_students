import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_entity.freezed.dart';

@freezed
class OfferEntity with _$OfferEntity {
  const factory OfferEntity({
    required String id,
    required String title,
    required String description,
    required double price,
    required String employment,
  }) = _OfferEntity;
}
