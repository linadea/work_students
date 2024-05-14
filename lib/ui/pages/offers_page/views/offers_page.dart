import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../domain/entities/offer_entity.dart';
import '../../../../domain/entities/person_entity.dart';
import '../../../../domain/entities/person_type_enum_entity.dart';
import '../../../controllers/global_person_controller.dart';
import '../../../widgets/custom_svg_scon.dart';
import '../../../widgets/gradient_border_container.dart';
import '../../../widgets/svg_icon.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<GlobalPersonController>();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: SvgIcon(
                  assetName: c.personType == PersonTypeEnumEntity.student
                      ? 'assets/svg/edit.svg'
                      : 'assets/svg/student.svg',
                  height: 22,
                  color: mainColor,
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
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: SvgIcon(
                  assetName: 'assets/svg/contract.svg',
                  height: 22,
                  color: mainColor,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'contacts'.tr,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: textColorDark),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: SvgIcon(
                  assetName: 'assets/svg/user.svg',
                  height: 22,
                  color: mainColor,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                'profile'.tr,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: textColorDark),
              ),
            ],
          )
        ][_currentPageIndex],
      ),
      body: [
        _pageOfferOrStudents(context, c),
        Container(),
        Container(),
      ][_currentPageIndex],
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          iconSize: 28,
          selectedItemColor: mainColor,
          unselectedItemColor: textColorLight,
          items: [
            BottomNavigationBarItem(
              icon: CustomSvgIcon(
                assetName: c.personType == PersonTypeEnumEntity.student
                    ? 'assets/svg/edit.svg'
                    : 'assets/svg/student.svg',
                height: 28,
                isSelected: _currentPageIndex == 0,
                selectedColor: mainColor,
                unselectedColor: textColorLight,
              ),
              label: c.personType == PersonTypeEnumEntity.student
                  ? 'offers'.tr
                  : 'students'.tr,
            ),
            BottomNavigationBarItem(
              icon: CustomSvgIcon(
                assetName: 'assets/svg/contract.svg',
                height: 28,
                isSelected: _currentPageIndex == 1,
                selectedColor: mainColor,
                unselectedColor: textColorLight,
              ),
              label: 'contacts'.tr,
            ),
            BottomNavigationBarItem(
              icon: CustomSvgIcon(
                assetName: 'assets/svg/user.svg',
                height: 28,
                isSelected: _currentPageIndex == 2,
                selectedColor: mainColor,
                unselectedColor: textColorLight,
              ),
              label: 'profile'.tr,
            ),
          ],
        );
      }),
    );
  }

  Widget? _pageOfferOrStudents(BuildContext context, GlobalPersonController c) {
    return c.person?.when(
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
      customer: (
        id,
        firstName,
        lastName,
        phone,
        email,
        imageUrl,
        company,
        position,
        city,
        students,
      ) =>
          _students(
        context,
        id,
        firstName,
        lastName,
        phone,
        email,
        imageUrl,
        company,
        position,
        city,
        students,
      ),
      empty: _empty,
    );
  }

  Widget _students(
      BuildContext context,
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
      itemCount: students?.length ?? 0,
      itemBuilder: (context, index) {
        return students?[index].maybeMap(
          orElse: () => Container(),
          student: (student) => _student(context, student),
        );
      },
    );
  }

  Widget _student(BuildContext context, Student student) {
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: GradientBorderContainer(
        borderRadius: 22.0,
        borderWidth: 2.0,
        width: containerWidth,
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12.0),
              child: Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.position ?? '',
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: textColorDark,
                        height: 1.6),
                  ),
                  Text(
                    student.desiredSalary ?? '',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 10,
                      color: startGradientColor,
                      height: 1.6,
                    ),
                  ),
                  Text(
                    '${student.firstName}, ${student.lastName}, студент(ка)',
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 10,
                        color: textColorDark,
                        fontWeight: FontWeight.w400,
                        height: 1.6),
                  ),
                  Text(
                    student.employment ?? '',
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
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: SvgIcon(
                assetName: 'assets/svg/arrow.svg',
                height: 32,
                color: mainColor,
              ),
            ),
          ],
        ),
      ),
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
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SvgIcon(
                    assetName: 'assets/svg/arrow.svg',
                    height: 32,
                    color: mainColor,
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
