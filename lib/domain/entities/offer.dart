import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer.freezed.dart';

@freezed
class Offer with _$Offer {
  const factory Offer({
    required String id,
    required String title,
    required String description,
    required double price,
    required String employment,
    required bool isFavorite,
  }) = _Offer;
}
