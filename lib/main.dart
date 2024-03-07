import 'package:caracas_ya_app/controllers/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:caracas_ya_app/database/db.dart';
import 'package:caracas_ya_app/routes/routes.dart';

void main() async {
  // Initialize
  try {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await dotenv.load(fileName: ".env");
    await IsarHelper.instance.init();

    runApp(
      GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GetMaterialApp(
          locale: const Locale('es', 'ES'),
          defaultTransition: Transition.native,
          initialRoute: Routes.login,
          getPages: Routes.pages,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF04BF62)),
            textTheme: GoogleFonts.interTextTheme(),
            useMaterial3: true,
          ),
        ),
      ),
    );
  } catch (e) {
    debugPrint(e.toString());
  } finally {
    FlutterNativeSplash.remove();
  }
}
