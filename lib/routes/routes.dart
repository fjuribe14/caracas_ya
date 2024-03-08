import 'package:get/get.dart';

import 'package:caracas_ya_app/pages/pages.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String settings = '/settings';

  static List<GetPage<dynamic>>? pages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: settings, page: () => const SettingsPage()),
  ];
}
