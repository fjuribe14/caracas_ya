import 'package:caracas_ya_app/database/db.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:caracas_ya_app/routes/routes.dart';

void main() async {
  // Initialize
  try {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await IsarHelper.instance.init();
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint(e.toString());
  } finally {
    FlutterNativeSplash.remove();
  }

  runApp(
    GetMaterialApp(
      locale: const Locale('es', 'ES'),
      defaultTransition: Transition.native,
      initialRoute: Routes.home,
      getPages: Routes.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF04BF62)),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
    ),
  );
}
