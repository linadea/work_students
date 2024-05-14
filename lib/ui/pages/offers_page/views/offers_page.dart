import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../domain/entities/person_type_enum_entity.dart';
import '../../../controllers/global_person_controller.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<GlobalPersonController>();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Row(
          children: [
            SvgPicture.asset(
              c.personType == PersonTypeEnumEntity.student
                  ? 'assets/svg/edit.svg'
                  : 'assets/svg/student.svg',
              height: 22,
            ),
            const SizedBox(width: 4),
            Text(
              c.personType == PersonTypeEnumEntity.student
                  ? 'my_offers'.tr
                  : 'students'.tr,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: textColorDark),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Offers Page'),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          iconSize: 28,
          selectedItemColor: textColorDark,
          unselectedItemColor: textColorLight,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                c.personType == PersonTypeEnumEntity.student
                    ? 'assets/svg/edit.svg'
                    : 'assets/svg/student.svg',
                height: 28,
              ),
              label: c.personType == PersonTypeEnumEntity.student
                  ? 'offers'.tr
                  : 'students'.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/contract.svg',
                height: 28,
              ),
              label: 'contacts'.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/user.svg',
                height: 28,
              ),
              label: 'profile'.tr,
            ),
          ],
        );
      }),
    );
  }
}
