import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:caracas_ya_app/ui/ui.dart';
import 'package:caracas_ya_app/controllers/controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Login Page')),
      body: GetBuilder(
        init: AuthController(),
        builder: (controller) {
          return SingleChildScrollView(
            key: key,
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Get.theme.primaryColor,
                    ),
                    child: const SafeArea(child: Text('Login Page')),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Obx(() => Text('${controller.usuario['username']}')),
                          const Spacer(),
                          TextfieldUi(
                            controller: controller.username,
                            decoration: const InputDecoration(
                              labelText: 'Usuario',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => TextfieldUi(
                              controller: controller.password,
                              obscureText: !controller.showPassword.value,
                              decoration: InputDecoration(
                                labelText: 'Contraseña',
                                suffixIcon: GestureDetector(
                                  onTap: () => controller.showPassword.value =
                                      !controller.showPassword.value,
                                  child: controller.showPassword.isFalse
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: const Text('Olvide tu contraseña.'),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => controller.login(),
                                  style: ButtonStyle(
                                    shape: const MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                    ),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Get.theme.primaryColor),
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(vertical: 16.0)),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Get.theme.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 40,
                            thickness: 1,
                            color: Get.theme.highlightColor,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      'assets/icons/google.svg',
                                      width: 24.0,
                                      height: 24.0),
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Get
                                                  .theme.unselectedWidgetColor,
                                              width: 1.0),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8.0))),
                                    ),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Get.theme.colorScheme.background),
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(vertical: 16)),
                                  ),
                                  label: Text(
                                    'Continuar con Google',
                                    style: TextStyle(
                                        color: Get.theme.unselectedWidgetColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      'assets/icons/facebook.svg',
                                      width: 24.0,
                                      height: 24.0),
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Get
                                                  .theme.unselectedWidgetColor,
                                              width: 1.0),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8.0))),
                                    ),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Get.theme.colorScheme.background),
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(vertical: 16.0)),
                                  ),
                                  label: Text(
                                    'Continuar con Facebook',
                                    style: TextStyle(
                                        color: Get.theme.unselectedWidgetColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text('¿No tienes cuenta?'),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Registrate'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
