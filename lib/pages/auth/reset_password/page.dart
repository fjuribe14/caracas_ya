import 'package:caracas_ya_app/config/theme_config.dart';
import 'package:caracas_ya_app/controllers/controller.dart';
import 'package:caracas_ya_app/pages/auth/reset_password/reset_password_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:caracas_ya_app/routes/routes.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restablecer contraseña')),
      body: GetBuilder(
        init: ResetPasswordController(),
        builder: (controller) => Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.33,
                child: SvgPicture.asset(
                  'assets/images/svg/fingerprint.svg',
                  fit: BoxFit.contain,
                  // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                  'Que bueno que has decidido restablecer la contraseña'),
              const SizedBox(height: 24),
              Obx(() => Text(
                    '${controller.usuario['name']}',
                    style: Get.textTheme.titleMedium,
                  )),
              const SizedBox(height: 8),
              Obx(() => Text(
                    '${controller.usuario['username']}',
                    style: Get.textTheme.titleMedium,
                  )),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.toNamed(Routes.resetActivationCode),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            ThemeConfig.lightColorScheme.primary,
                          ),
                        ),
                        child: Text('Continuar',
                            style: TextStyle(
                                color: ThemeConfig.lightColorScheme.onPrimary)),
                      ))
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: () => null,
                          child: const Text('Otro usuario')))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
