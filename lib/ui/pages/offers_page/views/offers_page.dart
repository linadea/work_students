import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../domain/entities/offer_entity.dart';
import '../../../../domain/entities/person_entity.dart';
import '../../../../domain/entities/person_type_enum_entity.dart';
import '../../../controllers/global_person_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_svg_icon.dart';
import '../../../widgets/gradient_border_container.dart';
import '../../../widgets/svg_icon.dart';
import '../controllers/offers_page_controller.dart';

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
                'my_contacts'.tr,
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
                'my_profile'.tr,
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
        _contacts(context),
        _profile(context, c),
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
      student: (
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
        offers,
        description,
      ) =>
          _offers(
        context,
        id,
        firstName,
        lastName,
        phone,
        position,
        imageUrl,
        email,
        employment,
        experience,
        education,
        skills,
        desiredSalary,
        offers,
        description,
      ),
      customer: (id, firstName, lastName, phone, email, imageUrl, company,
              position, city, students) =>
          _students(context, id, firstName, lastName, phone, email, imageUrl,
              company, position, city, students),
      empty: _empty,
    );
  }

  Widget _studentsList(
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
          student: (student) => _student(context, student, index),
        );
      },
    );
  }

  Widget _studentDetail(BuildContext context, OffersPageController c) {
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0, top: 16.0, bottom: 16.0),
          child: GestureDetector(
            onTap: () {
              c.isDetailPerson.value = false;
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios,
                    color: textColorLight, size: 16),
                const SizedBox(width: 6),
                Text(
                  'back'.tr,
                  style: const TextStyle(
                    color: textColorLight,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: GradientBorderContainer(
                width: containerWidth,
                child: Column(
                  children: [
                    const SizedBox(height: 42),
                    Text(
                      'about_the_student'.tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: textColorLight,
                      ),
                    ),
                    const SizedBox(height: 33),
                    Padding(
                      padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.currentPerson.value?.position ?? '',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: textColorDark,
                            ),
                          ),
                          Text(
                              '${c.currentPerson.value?.firstName ?? ''} ${c.currentPerson.value?.lastName ?? ''}, студент(ка)',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: textColorLight,
                                fontWeight: FontWeight.w400,
                              )),
                          Row(
                            children: [
                              Text(
                                c.currentPerson.value?.maybeWhen(
                                      orElse: () => '',
                                      student: (id,
                                              firstName,
                                              lastName,
                                              imageUrl,
                                              position,
                                              phone,
                                              email,
                                              employment,
                                              experience,
                                              education,
                                              skills,
                                              desiredSalary,
                                              offers,
                                              _) =>
                                          employment ?? '',
                                    ) ??
                                    '',
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: startGradientColor,
                                  height: 1.6,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                c.currentPerson.value?.maybeWhen(
                                      orElse: () => '',
                                      student: (id,
                                              firstName,
                                              lastName,
                                              imageUrl,
                                              position,
                                              phone,
                                              email,
                                              employment,
                                              experience,
                                              education,
                                              skills,
                                              desiredSalary,
                                              offers,
                                              _) =>
                                          desiredSalary ?? '',
                                    ) ??
                                    '',
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: startGradientColor,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          ..._buildTextWithBullets(
                              c.currentPerson.value?.maybeWhen(
                                    orElse: () => '',
                                    student: (id,
                                            firstName,
                                            lastName,
                                            imageUrl,
                                            position,
                                            phone,
                                            email,
                                            employment,
                                            experience,
                                            education,
                                            skills,
                                            desiredSalary,
                                            offers,
                                            description) =>
                                        description,
                                  ) ??
                                  ''),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'agree'.tr,
                      isActive: true,
                      width: containerWidth - 44,
                      onTap: () {},
                    ),
                    const SizedBox(height: 39),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
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
    final c = Get.find<OffersPageController>();
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: c.isDetailPerson.value
            ? _studentDetail(context, c)
            : _studentsList(
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
      ),
    );
  }

  Widget _student(BuildContext context, Student student, int index) {
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  final c = Get.find<OffersPageController>();
                  c.currentPerson.value = student;
                  c.isDetailPerson.value = true;
                },
                child: const SvgIcon(
                  assetName: 'assets/svg/arrow.svg',
                  height: 32,
                  color: mainColor,
                ),
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
      List<OfferEntity>? offers,
      String? description) {
    final c = Get.find<OffersPageController>();
    return Obx(() => AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: c.isDetailOffer.value
              ? _offerDetail(context, c)
              : _offersList(
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
                  offers,
                  c,
                ),
        ));
  }

  Widget _offersList(
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
      List<OfferEntity>? offers,
      OffersPageController c) {
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
                        offers![index].customer?.maybeWhen(
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
                                orElse: () => '') ??
                            '',
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 10,
                            color: textColorDark,
                            fontWeight: FontWeight.w400,
                            height: 1.6),
                      ),
                      Text(
                        offers[index].customer?.maybeWhen(
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
                                orElse: () => '') ??
                            '',
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
                  child: GestureDetector(
                    onTap: () {
                      c.currentOffer.value = offers[index];
                      c.isDetailOffer.value = true;
                    },
                    child: const SvgIcon(
                      assetName: 'assets/svg/arrow.svg',
                      height: 32,
                      color: mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _offerDetail(BuildContext context, OffersPageController c) {
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0, top: 16.0, bottom: 16.0),
          child: GestureDetector(
            onTap: () {
              c.isDetailOffer.value = false;
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios,
                    color: textColorLight, size: 16),
                const SizedBox(width: 6),
                Text(
                  'back'.tr,
                  style: const TextStyle(
                    color: textColorLight,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: GradientBorderContainer(
                width: containerWidth,
                child: Column(
                  children: [
                    const SizedBox(height: 42),
                    Text(
                      'offer_details'.tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: textColorLight,
                      ),
                    ),
                    const SizedBox(height: 33),
                    Padding(
                      padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.currentOffer.value?.title ?? '',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: textColorDark,
                            ),
                          ),
                          Text(
                            c.currentOffer.value?.customer?.maybeWhen(
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
                                    orElse: () => '') ??
                                '',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: textColorLight,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(height: 6.0),
                          Row(
                            children: [
                              Text(
                                c.currentOffer.value?.employment ?? '',
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: endGradientColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                c.currentOffer.value?.salary ?? '',
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: endGradientColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          ..._buildTextWithBullets(
                              c.currentOffer.value?.description ?? ''),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'agree'.tr,
                      isActive: true,
                      width: containerWidth - 44,
                      onTap: () {},
                    ),
                    const SizedBox(height: 39),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTextWithBullets(String text) {
    List<Widget> list = [];
    text.split('\n').forEach((line) {
      if (line.startsWith('•')) {
        list.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        color: textColorLight,
                        fontWeight: FontWeight.w400)),
                Expanded(
                  child: Text(
                    line.substring(1).trim(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        color: textColorLight),
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (line.isNotEmpty) {
        list.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              line,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: textColorDark),
            ),
          ),
        );
      } else {
        list.add(const SizedBox(height: 8.0));
      }
    });
    return list;
  }

  Widget _empty(String? id, String? firstName, String? lastName,
      String? imageUrl, String? position) {
    return const Center(
      child: Text('Empty'),
    );
  }

  Widget _contacts(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/png/oops.png'),
          Text(
            'message'.tr,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              color: textColorDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profile(BuildContext context, GlobalPersonController c) {
    final person = c.person;
    return ListView(
      padding: const EdgeInsets.only(left: 16, right: 16),
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(person?.imageUrl ?? ''),
          ),
          title: Text(
            person?.firstName ?? '',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: textColorDark,
            ),
          ),
          subtitle: Text(
            person?.position ?? '',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: textColorLight,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const SizedBox(height: 12.0),
        Text(
          'settings'.tr,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (c.personType == PersonTypeEnumEntity.student)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const SvgIcon(
              assetName: 'assets/svg/resume.svg',
              height: 24,
              color: textColorDark,
            ),
            title: Text(
              'resume'.tr,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColorDark,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const SvgIcon(
            assetName: 'assets/svg/notification.svg',
            height: 24,
            color: textColorDark,
          ),
          title: Text('messages'.tr,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColorDark,
              )),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          trailing: const SvgIcon(
            assetName: 'assets/svg/exit.svg',
            height: 24,
            color: Colors.red,
          ),
          title: Text(
            'exit'.tr,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.red),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
