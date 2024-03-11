import 'package:caracas_ya_app/pages/settings/settings_controller.dart';
import 'package:caracas_ya_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.onSurface,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: GetBuilder(
          init: SettingsController(),
          builder: (controller) {
            return Obx(() {
              return SettingsList(
                sections: [
                  SettingsSection(
                    title: const Text('Cuenta'),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: const Icon(Icons.person_outline_rounded),
                        title: const Text('Perfil de usuario'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: (context) {
                          // Get.toNamed(Routes.security);
                        },
                      ),
                      SettingsTile.navigation(
                        leading: const Icon(Icons.logout_rounded),
                        title: const Text('Cerrar sesión'),
                        onPressed: (context) async {
                          await controller.logout();
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: const Text('Seguridad'),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: const Icon(Icons.lock_open_rounded),
                        title: const Text('Cambiar contraseña'),
                        onPressed: (context) {
                          Get.toNamed(Routes.resetPassword);
                        },
                      ),
                      SettingsTile.switchTile(
                        onToggle: (value) async {
                          await controller.toggleBiometric();
                        },
                        initialValue: controller.biometricActivated.value,
                        leading: const Icon(Icons.fingerprint_rounded),
                        title: Text(
                            '${controller.biometricActivated.isFalse ? 'Habilitar' : 'Deshabilitar'} biometría'),
                        description: const Text(
                            'Usa tu huella digital para iniciar sesión y hacer opciones más seguras.'),
                      ),
                    ],
                  ),
                  SettingsSection(
                    title: const Text('Aplicación'),
                    tiles: <SettingsTile>[
                      SettingsTile.switchTile(
                        onToggle: (value) async {
                          await controller.toggleNotifications(value);
                        },
                        initialValue: controller.notificationsActivated.value,
                        leading: const Icon(Icons.notifications_on_outlined),
                        title: Text(
                            '${controller.notificationsActivated.isFalse ? 'Habilitar' : 'Deshabilitar'} notificaciones'),
                      ),
                      SettingsTile.switchTile(
                        onToggle: (value) async {
                          await controller.toggleTheme();
                        },
                        initialValue: controller.darkModeActivated.value,
                        leading: Icon(controller.darkModeActivated.value
                            ? Icons.nights_stay_outlined
                            : Icons.wb_sunny_outlined),
                        title: Text(
                            '${controller.darkModeActivated.value ? 'Deshabilitar' : 'Habilitar'} modo oscuro'),
                      ),
                    ],
                  ),
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
