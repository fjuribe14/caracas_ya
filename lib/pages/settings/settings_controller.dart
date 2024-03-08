import 'package:caracas_ya_app/helpers/helper.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:caracas_ya_app/config/theme_config.dart';
import 'package:caracas_ya_app/controllers/controller.dart';

class SettingsController extends GetxController {
  final storage = const FlutterSecureStorage();
  final biometricActivated = false.obs;
  final notificationsActivated = false.obs;
  final darkModeActivated = false.obs;

  @override
  void onInit() async {
    await init();
    super.onInit();
  }

  Future<void> init() async {
    biometricActivated.value = await storage.read(key: 'biometric') == 'true';
    darkModeActivated.value = await storage.read(key: 'theme') == 'true';
    notificationsActivated.value =
        await storage.read(key: 'notifications') == 'true';

    debugPrint({'notificationsActivated': notificationsActivated}.toString());
    debugPrint({'biometricActivated': biometricActivated}.toString());
    debugPrint({'darkModeActivated': darkModeActivated}.toString());
  }

  Future<void> toggleBiometric() async {
    final isBiometricAvailable =
        await Helper().checkAndRequestBiometricPermission();

    if (isBiometricAvailable) {
      biometricActivated.value = !biometricActivated.value;
      await storage.write(
          key: 'biometric', value: biometricActivated.value.toString());
    }
  }

  Future<void> toggleNotifications() async {
    notificationsActivated.value = !notificationsActivated.value;
    await storage.write(
        key: 'notifications', value: notificationsActivated.value.toString());
  }

  Future<void> toggleTheme() async {
    darkModeActivated.value = !darkModeActivated.value;
    Get.changeTheme(darkModeActivated.isFalse
        ? ThemeConfig.lightTheme
        : ThemeConfig.darkTheme);
    await storage.write(
        key: 'theme', value: darkModeActivated.value.toString());
  }

  Future<void> logout() async {
    await AuthController().logout();
  }
}
