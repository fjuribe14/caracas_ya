import 'package:caracas_ya_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restablecer contraseña')),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const Text('ResetPasswordPage'),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () =>
                            Get.toNamed(Routes.resetActivationCode),
                        child: const Text('Continuar')))
              ],
            ),
          ])),
    );
  }
}
