import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/gradient_border_container.dart';
import '../../../widgets/labeled_input_field.dart';
import '../controllers/auth_page_controller.dart';

class AuthPage extends StatelessWidget {
  final c = Get.find<AuthPageController>();

  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width - 32 * 2;

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 16),
                    SvgPicture.asset(
                      'assets/svg/logo.svg',
                      height: 60,
                    ),
                    const SizedBox(height: 6),
                    const Center(
                      child: Text(
                        'WORK\n[STUDENTS]',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColorDark,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.9,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GradientBorderContainer(
                      width: containerWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 29, right: 29, top: 41, bottom: 41),
                        child: Column(
                          children: [
                            Text('login_or_register'.tr,
                                style: const TextStyle(
                                  color: textColorDark,
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                )),
                            const SizedBox(height: 20),
                            LabeledInputField(
                              label: 'country_region'.tr,
                            ),
                            const SizedBox(height: 18),
                            LabeledInputField(
                              label: 'phone_number'.tr,
                            ),
                            const SizedBox(height: 18),
                            CustomButton(
                              text: 'continue'.tr,
                              width: containerWidth,
                              onTap: () => Get.find<AuthPageController>()
                                  .signIn()
                                  .then((_) => Get.offAllNamed('/main',
                                      arguments: Transition.zoom)),
                            ),
                            const SizedBox(height: 18),
                            Text('or'.tr,
                                style: const TextStyle(
                                  color: textColorDark,
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                )),
                            const SizedBox(height: 18),
                            CustomIconButton(
                              iconName: 'assets/svg/mail.svg',
                              text: 'use_email'.tr,
                              width: containerWidth,
                              onTap: () {},
                            ),
                            const SizedBox(height: 18),
                            CustomIconButton(
                              iconName: 'assets/svg/google.svg',
                              text: 'sign_in_with_google'.tr,
                              width: containerWidth,
                              onTap: () {},
                            ),
                            const SizedBox(height: 18),
                            CustomIconButton(
                              iconName: 'assets/svg/facebook.svg',
                              text: 'login_via_facebook'.tr,
                              width: containerWidth,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
