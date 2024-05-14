import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../domain/entities/offer_entity.dart';
import '../../../../domain/entities/person_entity.dart';
import '../../../../domain/entities/person_type_enum_entity.dart';
import '../../../controllers/global_person_controller.dart';
import '../../../widgets/gradient_border_container.dart';

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
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: SvgPicture.asset(
                c.personType == PersonTypeEnumEntity.student
                    ? 'assets/svg/edit.svg'
                    : 'assets/svg/student.svg',
                height: 22,
              ),
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
      body: c.person?.when(
        student: (id,
                firstName,
                lastName,
                phone,
                email,
                imageUrl,
                position,
                employment,
                experience,
                education,
                skills,
                desiredSalary,
                offers) =>
            _offers(
                context,
                id,
                firstName,
                lastName,
                phone,
                email,
                imageUrl,
                position,
                employment,
                experience,
                education,
                skills,
                desiredSalary,
                offers),
        customer: _students,
        empty: _empty,
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

  Widget _students(
      String? id,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? imageUrl,
      String? company,
      String? position,
      String? city,
      List<PersonEntity>? students) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Student $index'),
        );
      },
    );
  }

  Widget _offers(
      BuildContext context,
      String? id,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? imageUrl,
      String? position,
      String? employment,
      String? experience,
      String? education,
      String? skills,
      String? desiredSalary,
      List<OfferEntity>? offers) {
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    return ListView.builder(
      itemCount: offers?.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
          child: GradientBorderContainer(
            borderRadius: 22.0,
            borderWidth: 2.0,
            width: containerWidth,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 12.0, bottom: 12.0),
                  child: Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offers?[index].title ?? '',
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textColorDark,
                            height: 1.6),
                      ),
                      Text(
                        offers?[index].salary ?? '',
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 10,
                          color: startGradientColor,
                          height: 1.6,
                        ),
                      ),
                      Text(
                        offers![index].customer.maybeWhen(
                            customer: (id,
                                    firstName,
                                    lastName,
                                    phone,
                                    email,
                                    imageUrl,
                                    company,
                                    position,
                                    city,
                                    students) =>
                                '$firstName, $company',
                            orElse: () => ''),
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 10,
                            color: textColorDark,
                            fontWeight: FontWeight.w400,
                            height: 1.6),
                      ),
                      Text(
                        offers[index].customer.maybeWhen(
                            customer: (id,
                                    firstName,
                                    lastName,
                                    phone,
                                    email,
                                    imageUrl,
                                    company,
                                    position,
                                    city,
                                    students) =>
                                city ?? '',
                            orElse: () => ''),
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            height: 1.6),
                      )
                    ],
                  )),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/svg/arrow.svg',
                    height: 32,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _empty(String? id) {
    return const Center(
      child: Text('Empty'),
    );
  }
}
