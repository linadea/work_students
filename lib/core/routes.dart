import 'package:get/get.dart';

import '../ui/pages/main_page/bindings/main_page_bindings.dart';
import '../ui/pages/main_page/views/main_page.dart';

class Routes {
  // ignore: constant_identifier_names
  static const HOME = '/home';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const MainPage(),
      binding: MainPageBindings(),
    ),
  ];
}
