import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_checkbox_button.dart';
import '../../../widgets/gradient_border_container.dart';
import '../controllers/main_page_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final textController = TextEditingController();
  final c = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              left: 32,
              right: 32,
              top: 76,
              bottom: 487,
              child: Container(
                width: 326,
                height: 281,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: SvgPicture.asset(
                        'assets/svg/logo.svg',
                        height: 100,
                      ),
                    ),
                    Container(
                      width: 219,
                      height: 48,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WORK [STUDENTS]',
                            style: TextStyle(
                              color: textColorDark,
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              height: 1,
                              letterSpacing: 6,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
                child: GradientBorderContainer(
              width: 326.0,
              height: 326.0,
              borderWidth: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(27.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'who_are_you'.tr,
                        style: const TextStyle(
                          color: textColorDark,
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 38),
                      Obx(() => CustomCheckboxButton(
                            text: 'i_am_a_student'.tr,
                            iconName: 'assets/svg/student.svg',
                            isChecked: c.isStudent.value,
                            onChanged: (value) => c.setStudent(value),
                          )),
                      const SizedBox(height: 18),
                      Obx(() => CustomCheckboxButton(
                            text: 'i_am_an_employer'.tr,
                            iconName: 'assets/svg/client.svg',
                            isChecked: c.isEmployer.value,
                            onChanged: (value) => c.setEmployer(value),
                          )),
                      const SizedBox(height: 38),
                      Obx(() => CustomButton(
                            text: 'continue'.tr,
                            isActive: c.isStudent.value || c.isEmployer.value,
                            onTap: () {},
                          )),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
