import 'package:get/get.dart';
import 'package:work_students/domain/entities/offer_entity.dart';
import 'package:work_students/domain/entities/person_entity.dart';

import 'models/profile_screen_state.dart';

class MainPageController extends GetxController {
  Rx<OfferEntity?> currentOffer = Rx<OfferEntity?>(null);
  var isDetailOffer = false.obs;
  Rx<PersonEntity?> currentPerson = Rx<PersonEntity?>(null);
  var isDetailPerson = false.obs;

  var profileScreenState = const ProfileScreenState.main().obs;
}
