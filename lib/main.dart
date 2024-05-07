import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/l10n/l10n.dart';
import 'ui/pages/main_page/views/main_page.dart';

void main() {
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
      home: const MainPage(),
    );
  }
}
