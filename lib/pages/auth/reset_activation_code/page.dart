import 'dart:async';

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
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
                print("Completed");
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
          ],
        ),
      ),
    );
  }
}
