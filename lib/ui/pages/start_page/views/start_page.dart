import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_checkbox_button.dart';
import '../../../widgets/gradient_border_container.dart';
import '../controllers/start_page_controller.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final textController = TextEditingController();
  final c = Get.find<StartPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SvgPicture.asset(Assets.resourceSvgBackground, fit: BoxFit.cover),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                          Assets.resourceSvgLogo,
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
                const SizedBox(height: 32),
                Center(
                    child: GradientBorderContainer(
                  width: MediaQuery.of(context).size.width - 32 * 2,
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
                                iconName: Assets.resourceSvgStudent,
                                isChecked: c.isStudent.value,
                                onChanged: (value) => c.setStudent(value),
                              )),
                          const SizedBox(height: 18),
                          Obx(() => CustomCheckboxButton(
                                text: 'i_am_an_employer'.tr,
                                iconName: Assets.resourceSvgClient,
                                isChecked: c.isEmployer.value,
                                onChanged: (value) => c.setEmployer(value),
                              )),
                          const SizedBox(height: 38),
                          Obx(() => CustomButton(
                                text: 'continue'.tr,
                                isActive:
                                    c.isStudent.value || c.isEmployer.value,
                                onTap: () => Get.toNamed('/auth',
                                    arguments: Transition.zoom),
                              )),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
