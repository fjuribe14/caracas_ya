import 'package:caracas_ya_app/pages/auth/login/page.dart';
import 'package:caracas_ya_app/pages/home/page.dart';
import 'package:get/get.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';

  static List<GetPage<dynamic>>? pages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => const LoginPage()),
  ];
}
