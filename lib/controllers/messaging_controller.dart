import 'package:caracas_ya_app/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void onInit() async {
    // await init();
    super.onInit();
  }

  Future<void> init() async {
    final settings = await Helper().requestNotificationPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      debugPrint(token);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        message.toMap().forEach((key, value) {
          print("$key: $value");
        });
        // Handle the message and display the notification in the UI
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("onMessageOpenedApp: $message");
        // Handle the notification when the app is opened from the notification
      });

      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    }
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }
}
