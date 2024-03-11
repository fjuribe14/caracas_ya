import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:caracas_ya_app/database/db.dart';
import 'package:caracas_ya_app/routes/routes.dart';
import 'package:caracas_ya_app/config/theme_config.dart';

void main() async {
  // Initialize
  try {
    const storage = FlutterSecureStorage();

    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    await dotenv.load(fileName: ".env");

    await IsarHelper.instance.init();

    Get.changeTheme(await storage.read(key: 'theme') == 'true'
        ? ThemeConfig.darkTheme
        : ThemeConfig.lightTheme);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint(e.toString());
  } finally {
    FlutterNativeSplash.remove();
  }

  runApp(
    GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: dotenv.env['APP_NAME'] ?? 'CaracasYaApp',
        locale: const Locale('es', 'ES'),
        defaultTransition: Transition.cupertinoDialog,
        getPages: Routes.pages,
        initialRoute: Routes.login,
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.darkTheme,
      ),
    ),
  );
}
