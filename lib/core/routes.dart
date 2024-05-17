// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:work_students/ui/pages/auth_page/bindings/auth_page_bindings.dart';
import 'package:work_students/ui/pages/auth_page/views/auth_page.dart';

import '../ui/pages/start_page/bindings/start_page_bindings.dart';
import '../ui/pages/start_page/views/start_page.dart';
import '../ui/pages/main_page/bindings/main_page_bindings.dart';
import '../ui/pages/main_page/views/main_page.dart';

class Routes {
  static const START = '/home';
  static const AUTH = '/auth';
  static const MAIN = '/main';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.START,
      page: () => const StartPage(),
      binding: StartPageBindings(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthPage(),
      binding: AuthPageBindings(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: OffersPageBindings(),
    ),
  ];
}
