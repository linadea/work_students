import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/dependencies.dart';
import 'core/l10n/l10n.dart';
import 'core/routes.dart';
import 'ui/controllers/global_person_controller.dart';

void main() {
  setupDependencies();
  Get.put(GlobalPersonController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Work Student',
      translations: Messages(),
      locale: const Locale('uk', 'UA'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.HOME,
    );
  }
}
