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
import '../../../widgets/labeled_input_field.dart';
import '../../../widgets/svg_icon.dart';
import '../controllers/main_page_controller.dart';
import '../controllers/models/profile_screen_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<GlobalPersonController>();
    final mainController = Get.find<MainPageController>();
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
                'my_contracts'.tr,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: textColorDark),
              ),
            ],
          ),
          Obx(
            () => mainController.profileScreenState.value.when(
              main: () => Row(
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
              ),
              settings: () => Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 3.0),
                    child: SvgIcon(
                      assetName: 'assets/svg/settings.svg',
                      height: 22,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'profile_settings'.tr,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: textColorDark),
                  ),
                ],
              ),
              resume: () => Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 3.0),
                    child: SvgIcon(
                      assetName: 'assets/svg/resume.svg',
                      height: 22,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'resume'.tr,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: textColorDark),
                  ),
                ],
              ),
              notifications: () => Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 3.0),
                    child: SvgIcon(
                      assetName: 'assets/svg/notification.svg',
                      height: 22,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'notifications'.tr,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: textColorDark),
                  ),
                ],
              ),
            ),
          )
        ][_currentPageIndex],
      ),
      body: [
        _pageOfferOrStudents(context, c),
        _contracts(context),
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
              label: 'contracts'.tr,
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

  Widget _studentDetail(BuildContext context, MainPageController c) {
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
    final c = Get.find<MainPageController>();
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
                  final c = Get.find<MainPageController>();
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
    final c = Get.find<MainPageController>();
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
      MainPageController c) {
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

  Widget _offerDetail(BuildContext context, MainPageController c) {
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
      String? imageUrl, String? position, String? phone, String? email) {
    return const Center(
      child: Text('Empty'),
    );
  }

  Widget _contracts(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
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
          const Spacer(),
        ],
      ),
    );
  }

  Widget _profile(BuildContext context, GlobalPersonController controller) {
    final mainController = Get.find<MainPageController>();
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: mainController.profileScreenState.value.when(
            main: () => _profileMainState(controller),
            settings: () => _profileSettingState(controller),
            resume: () => _profileResumeState(controller),
            notifications: () => _profileNotificationsState(controller)),
      ),
    );
  }

  Widget _profileMainState(GlobalPersonController c) {
    final person = c.person;
    final mainController = Get.find<MainPageController>();
    return ListView(
      padding: const EdgeInsets.only(left: 16, right: 16),
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 32,
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
          onTap: () {
            mainController.profileScreenState.value =
                const ProfileScreenState.settings();
          },
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
            onTap: () {
              mainController.profileScreenState.value =
                  const ProfileScreenState.resume();
            },
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
          onTap: () {
            mainController.profileScreenState.value =
                const ProfileScreenState.notifications();
          },
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

  Widget _profileSettingState(GlobalPersonController globalController) {
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    final mainController = Get.find<MainPageController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0, top: 16.0, bottom: 16.0),
          child: GestureDetector(
            onTap: () {
              mainController.profileScreenState.value =
                  const ProfileScreenState.main();
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
            child: Column(
              children: [
                GradientBorderContainer(
                  width: containerWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'personal_information'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: textColorDark,
                          ),
                        ),
                        const SizedBox(height: 16),
                        LabeledInputField(
                          label: 'first_name'.tr,
                          controller: TextEditingController(
                              text: globalController.person?.firstName),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        LabeledInputField(
                          label: 'last_name'.tr,
                          controller: TextEditingController(
                              text: globalController.person?.lastName),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        LabeledInputField(
                          label: 'phone_number'.tr,
                          controller: TextEditingController(
                              text: globalController.person?.phone),
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        LabeledInputField(
                          label: 'email'.tr,
                          controller: TextEditingController(
                              text: globalController.person?.email),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                ),
                ..._customerSpecificWidgets(globalController),
                const SizedBox(height: 22),
                CustomButton(
                  text: 'save_changes'.tr,
                  isActive: true,
                  width: containerWidth,
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 22.0, top: 16.0, bottom: 16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const SvgIcon(
                          assetName: 'assets/svg/bin.svg',
                          height: 24,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'delete_profile'.tr,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _customerSpecificWidgets(
      GlobalPersonController globalController) {
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    return globalController.person?.maybeWhen(
          orElse: () => [],
          customer: (id, firstName, lastName, imageUrl, position, phone, email,
                  company, city, students) =>
              [
            const SizedBox(
              height: 22,
            ),
            GradientBorderContainer(
              width: containerWidth,
              child: Padding(
                padding: const EdgeInsets.all(27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledInputField(
                      label: 'company'.tr,
                      controller: TextEditingController(text: company ?? ''),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    LabeledInputField(
                      label: 'position'.tr,
                      controller: TextEditingController(text: position ?? ''),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    LabeledInputField(
                      label: 'city'.tr,
                      controller: TextEditingController(text: city ?? ''),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ) ??
        [];
  }

  Widget _profileResumeState(GlobalPersonController globalController) {
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    final mainController = Get.find<MainPageController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0, top: 16.0, bottom: 8.0),
          child: GestureDetector(
            onTap: () {
              mainController.profileScreenState.value =
                  const ProfileScreenState.main();
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
            child: Column(
              children: [
                const SizedBox(height: 22),
                GradientBorderContainer(
                  width: containerWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabeledInputField(
                          label: 'first_and_last_name'.tr,
                          controller: TextEditingController(
                              text:
                                  '${globalController.person?.firstName} ${globalController.person?.lastName}'),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        LabeledInputField(
                          label: 'phone_number'.tr,
                          controller: TextEditingController(
                              text: globalController.person?.phone),
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        LabeledInputField(
                          label: 'email'.tr,
                          controller: TextEditingController(
                              text: globalController.person?.email),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                ..._studentSpecificWidgetsForResume(globalController),
                const SizedBox(height: 22),
                CustomButton(
                  text: 'save_changes'.tr,
                  isActive: true,
                  width: containerWidth,
                  onTap: () {},
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _studentSpecificWidgetsForResume(
      GlobalPersonController globalController) {
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    return globalController.person?.maybeWhen(
          orElse: () => [],
          student: (
            id,
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
            description,
          ) =>
              [
            GradientBorderContainer(
              width: containerWidth,
              child: Padding(
                padding: const EdgeInsets.all(27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledInputField(
                      label: 'position'.tr,
                      controller: TextEditingController(text: position ?? ''),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    LabeledInputField(
                      label: 'type_of_employment'.tr,
                      controller: TextEditingController(text: employment ?? ''),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            GradientBorderContainer(
              width: containerWidth,
              child: Padding(
                padding: const EdgeInsets.all(27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledInputField(
                      label: 'work_experience'.tr,
                      controller: TextEditingController(text: experience ?? ''),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    LabeledInputField(
                      label: 'education'.tr,
                      controller: TextEditingController(text: education ?? ''),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    LabeledInputField(
                      label: 'key_skills'.tr,
                      controller: TextEditingController(text: skills ?? ''),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    LabeledInputField(
                      label: 'desired_salary'.tr,
                      controller:
                          TextEditingController(text: desiredSalary ?? ''),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ) ??
        [];
  }

  Widget _profileNotificationsState(GlobalPersonController c) {
    final mainController = Get.find<MainPageController>();
    final containerWidth = MediaQuery.of(context).size.width - 20 * 2;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0, top: 16.0, bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                mainController.profileScreenState.value =
                    const ProfileScreenState.main();
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
          const Spacer(),
          Image.asset('assets/png/oops.png'),
          Text(
            'message2'.tr,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              color: textColorDark,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 22),
          CustomButton(
            text: 'allow_notifications'.tr,
            isActive: true,
            width: containerWidth,
            onTap: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
