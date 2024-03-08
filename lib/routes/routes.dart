import 'package:get/get.dart';

import 'package:caracas_ya_app/pages/pages.dart';

class Routes {
  static const String splash = '/';
  // Auth
  static const String login = '/login';
  static const String resetPassword = '/resetPassword';
  static const String resetActivationCode = '/resetActivationCode';
  // Home
  static const String home = '/home';
  static const String settings = '/settings';

  static List<GetPage<dynamic>>? pages = [
    // Auth
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: resetPassword, page: () => const ResetPasswordPage()),
    GetPage(
        name: resetActivationCode, page: () => const ResetActivationCodePage()),
    // Home
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: settings, page: () => const SettingsPage()),
  ];
}
