import 'dart:async';

import 'package:caracas_ya_app/config/theme_config.dart';
import 'package:caracas_ya_app/pages/auth/reset_activation_code/reset_activation_code_controller.dart';
import 'package:caracas_ya_app/pages/auth/reset_password/reset_password_controller.dart';
import 'package:caracas_ya_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetActivationCodePage extends StatelessWidget {
  const ResetActivationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final errorController = StreamController<ErrorAnimationType>.broadcast();

    return Scaffold(
      appBar: AppBar(title: const Text('Código de activación')),
      body: GetBuilder(
        init: ResetActivationCodeController(),
        builder: (controller) => Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Obx(() {
                final resetPasswordController =
                    Get.put(ResetPasswordController());
                return Text(
                    'Se envió un código de 6 cifras a su correo ${resetPasswordController.usuario['email']}  para restablecer la contraseña');
              }),
              const SizedBox(height: 24),
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.grey,
                ),
                animationDuration: const Duration(milliseconds: 300),
                // backgroundColor: Colors.blue.shade50,
                // enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                onCompleted: (v) {
                  controller.isCompleted.value = true;
                },
                onChanged: (value) {
                  print(value);
                  // setState(() {
                  //   currentText = value;
                  // });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () => controller.isCompleted.isTrue
                            ? Get.toNamed(Routes.home)
                            : null,
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
            ],
          ),
        ),
      ),
    );
  }
}
