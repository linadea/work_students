import 'package:get/get.dart';
import 'package:work_students/domain/entities/offer_entity.dart';
import 'package:work_students/domain/entities/person_entity.dart';

class OffersPageController extends GetxController {
  Rx<OfferEntity?> currentOffer = Rx<OfferEntity?>(null);
  var isDetailOffer = false.obs;
  Rx<PersonEntity?> currentPerson = Rx<PersonEntity?>(null);
  var isDetailPerson = false.obs;
}
