import 'package:get/get.dart';
import 'package:work_students/domain/entities/offer_entity.dart';

class OffersPageController extends GetxController {
  Rx<OfferEntity?> currentOffer = Rx<OfferEntity?>(null);
  var isDetailOffer = false.obs;
}
