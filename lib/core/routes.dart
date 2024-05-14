// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:work_students/ui/pages/auth_page/bindings/auth_page_bindings.dart';
import 'package:work_students/ui/pages/auth_page/views/auth_page.dart';

import '../ui/pages/main_page/bindings/main_page_bindings.dart';
import '../ui/pages/main_page/views/main_page.dart';
import '../ui/pages/offers_page/bindings/offers_page_bindings.dart';
import '../ui/pages/offers_page/views/offers_page.dart';

class Routes {
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const OFFERS = '/offers';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const MainPage(),
      binding: MainPageBindings(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthPage(),
      binding: AuthPageBindings(),
    ),
    GetPage(
      name: Routes.OFFERS,
      page: () => const OffersPage(),
      binding: OffersPageBindings(),
    ),
  ];
}
