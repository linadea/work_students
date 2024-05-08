import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/gradient_border_container.dart';
import '../../../widgets/labeled_input_field.dart';
import '../controllers/auth_page_controller.dart';

class AuthPage extends StatelessWidget {
  final c = Get.find<AuthPageController>();

  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
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
                  const SizedBox(height: 16),
                  GradientBorderContainer(
                    width: MediaQuery.of(context).size.width - 32 * 2,
                    height: 281,
                    child: const Column(
                      children: [],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
